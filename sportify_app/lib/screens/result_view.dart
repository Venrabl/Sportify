import 'package:flutter/material.dart';
import '../models/result.dart';

class ResultView extends StatelessWidget {
  final TestResult result;
  const ResultView({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Score: ${result.validReps} valid ${result.testType}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${result.postureErrors} posture errors detected', style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Save Result')),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
