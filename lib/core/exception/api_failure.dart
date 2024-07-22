class Failure {
  Failure({
    required this.message,
    this.errorCode = -1,
    this.details,
  });

  final String message;
  final Map<String, dynamic>? details;
  final int errorCode;

  @override
  String toString() {
    return message;
  }
}
