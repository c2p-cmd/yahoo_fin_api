class YahooFinException implements Exception {
  final int statusCode;
  final String message;

  const YahooFinException({
    required this.statusCode,
    this.message = "There was some error fetching data.",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YahooFinException &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode &&
          message == other.message;

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode;

  @override
  String toString() {
    return 'YahooFinException{statusCode: $statusCode, message: $message}';
  }
}
