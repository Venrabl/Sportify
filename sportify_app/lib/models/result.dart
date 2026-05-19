class TestResult {
  final String id;
  final String userId;
  final String testType;
  final int validReps;
  final int postureErrors;
  final String snippetPath; // local path to small video snippet
  final DateTime timestamp;
  TestResult({
    required this.id,
    required this.userId,
    required this.testType,
    required this.validReps,
    required this.postureErrors,
    required this.snippetPath,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'testType': testType,
    'validReps': validReps,
    'postureErrors': postureErrors,
    'snippetPath': snippetPath,
    'timestamp': timestamp.toIso8601String(),
  };
  factory TestResult.fromJson(Map<String,dynamic> j) => TestResult(
    id: j['id'],
    userId: j['userId'],
    testType: j['testType'],
    validReps: j['validReps'],
    postureErrors: j['postureErrors'],
    snippetPath: j['snippetPath'],
    timestamp: DateTime.parse(j['timestamp']),
  );
}
