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

bool isSearchBodyValid(Map<String, dynamic> jsonMap) {
  if (jsonMap['count'] == null || jsonMap['count'] == 0) {
    return false;
  }

  if (jsonMap['quotes'] == null) {
    return false;
  }

  if (jsonMap['quotes'] is List && jsonMap['quotes'].isEmpty) {
    return false;
  }

  return true;
}