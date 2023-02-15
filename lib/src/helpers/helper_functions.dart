bool isBodyValid(Map<String, dynamic> jsonMap) {
  if (jsonMap['quoteResponse'] == null) {
    return false;
  }

  if (jsonMap['quoteResponse']['result'] == null) {
    return false;
  }

  final List resultList = jsonMap['quoteResponse']['result'];
  if (resultList.isEmpty) {
    return false;
  }

  return true;
}