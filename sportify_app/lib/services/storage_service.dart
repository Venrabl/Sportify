import 'package:hive_flutter/hive_flutter.dart';
import '../models/result.dart';
import 'dart:convert';

class StorageService {
  static const String resultsBox = 'results_box';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(resultsBox);
  }

  static Future<void> saveResultLocal(TestResult result) async {
    final box = Hive.box(resultsBox);
    await box.put(result.id, result.toJson());
  }

  static List<TestResult> getPendingResults() {
    final box = Hive.box(resultsBox);
    return box.values.map((e) => TestResult.fromJson(Map<String,dynamic>.from(e))).toList();
  }

  static Future<void> removeResult(String id) async {
    final box = Hive.box(resultsBox);
    await box.delete(id);
  }
}
