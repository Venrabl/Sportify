import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/result.dart';
import 'flutter_secure_storage.dart' as secure; // or flutter_secure_storage

class ApiService {
  static const base = 'https://api.yoursportify.app'; // replace later

  static Future<http.Response> postResult(TestResult r, {String? token}) async {
    final uri = Uri.parse('$base/upload-result');
    final body = r.toJson();
    // We will send small snippet as multipart if required (but to save bandwidth we can send path and server will pull from signed URL, or send small compressed snippet)
    final headers = {
      'Content-Type': 'application/json',
      if (token!=null) 'Authorization': 'Bearer $token',
    };
    return await http.post(uri, headers: headers, body: jsonEncode(body));
  }

  static Future<http.Response> getLeaderboard({String? token}) async {
    final uri = Uri.parse('$base/leaderboard');
    return await http.get(uri, headers: { if (token!=null) 'Authorization': 'Bearer $token' });
  }

  // add login, signup endpoints similarly
}
