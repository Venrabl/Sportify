import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../services/ai_service.dart';
import '../services/storage_service.dart';
import '../services/api_service.dart';
import '../services/connectivity_service.dart';
import '../models/result.dart';
import 'package:path_provider/path_provider.dart';

class TestVideoScreen extends StatefulWidget {
  const TestVideoScreen({super.key});
  @override
  State<TestVideoScreen> createState() => _TestVideoScreenState();
}

class _TestVideoScreenState extends State<TestVideoScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool recording = false;
  String userId = 'demo-user-1';

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      _controller = CameraController(cameras!.first, ResolutionPreset.medium, enableAudio: false);
      await _controller!.initialize();
      setState((){});
    }
  }

  Future<void> startRecording() async {
    if (_controller==null || !_controller!.value.isInitialized) return;
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/snippet_${DateTime.now().millisecondsSinceEpoch}.mp4';
    await _controller!.startVideoRecording();
    setState(()=>recording=true);
    // record for 6-10 seconds; for demo we'll record 5 seconds
    await Future.delayed(const Duration(seconds: 6));
    final file = await _controller!.stopVideoRecording();
    setState(()=>recording=false);
    final saved = File(file.path);
    await analyzeAndSave(saved.path);
  }

  Future<void> analyzeAndSave(String videoPath) async {
    // run on-device AI
    final result = await AiService.analyzeVideoSimple(userId: userId, testType: 'squats', videoPath: videoPath);

    // save locally
    await StorageService.saveResultLocal(result);

    // try sync if online
    final online = await ConnectivityService.isOnline();
    if (online) {
      final res = await ApiService.postResult(result);
      if (res.statusCode == 200) {
        await StorageService.removeResult(result.id);
      }
    }

    // show result screen
    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => ResultView(result: result)));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record Test')),
      body: _controller == null || !_controller!.value.isInitialized
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              AspectRatio(aspectRatio: _controller!.value.aspectRatio, child: CameraPreview(_controller!)),
              const SizedBox(height: 12),
              Text(recording ? 'Recording...' : 'Press record to start', style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: recording ? null : startRecording,
                icon: const Icon(Icons.videocam),
                label: const Text('Record 6s Snippet'),
              ),
            ],
          ),
    );
  }
}
