library yahoo_fin_api;

import 'dart:convert';

import 'package:yahoo_fin_api/src/helpers/helper_functions.dart';
import 'package:yahoo_fin_api/src/models/exception.dart';
import 'package:yahoo_fin_api/src/secret.dart';
import 'package:http/http.dart' as http;

import 'src/models/models.dart';

Future<StockData> getData({required String ticker}) async {
  try {
    final response = await http.get(Uri.parse("$apiUrl$ticker"));

    if (response.statusCode != 200) {
      throw YahooFinException(
        statusCode: response.statusCode,
        message: "Error due to ${response.reasonPhrase}.",
      );
    }

    final decodedBodyMap = jsonDecode(utf8.decode(response.bodyBytes));

    if (isBodyValid(decodedBodyMap)) {
      final result = decodedBodyMap['quoteResponse']['result'][0];
      return StockData.fromJson(result);
    } else {
      throw const YahooFinException(
        statusCode: 404,
        message: "The stock you are looking for cannot be found!",
      );
    }
  } catch (_) {
    rethrow;
  }
}

Future<List<StockData>> getMultipleStocks(List<String> tickers) async {
  try {
    var ticker = tickers[0];
    for (int i = 1; i < tickers.length; i++) {
      var element = tickers[i];
      ticker += ',$element';
    }
    final response = await http.get(Uri.parse("$apiUrl$ticker"));

    if (response.statusCode != 200) {
      throw YahooFinException(
        statusCode: response.statusCode,
        message: "Error due to ${response.reasonPhrase}.",
      );
    }

    final decodedBodyMap = jsonDecode(utf8.decode(response.bodyBytes));

    if (decodedBodyMap['error'] != null) {
      throw YahooFinException(
        statusCode: response.statusCode,
        message: decodedBodyMap['error'].toString(),
      );
    }

    if (isBodyValid(decodedBodyMap)) {
      final List<dynamic> results = decodedBodyMap['quoteResponse']['result'];
      return List<StockData>.from(
        results.map((result) => StockData.fromJson(result)),
      );
    } else {
      throw const YahooFinException(
        statusCode: 404,
        message: "The stocks you are looking for cannot be found!",
      );
    }
  } catch (_) {
    rethrow;
  }
}

Future<StockSearchResult> searchForStock({required String ticker}) async {
  try {
    final qParams = {
      'q': ticker,
      'region': 'IN',
      'newsCount': '0',
    };
    final uri = Uri.https(baseUrl, path, qParams);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw YahooFinException(
        statusCode: response.statusCode,
        message: "Error due to ${response.reasonPhrase}.",
      );
    }

    final decodedMap = jsonDecode(utf8.decode(response.bodyBytes));

    if (isSearchBodyValid(decodedMap)) {
      return StockSearchResult.fromJson(decodedMap);
    } else {
      throw const YahooFinException(
        statusCode: 404,
        message: "The stock you are looking for cannot be found!",
      );
    }
  } catch (_) {
    rethrow;
  }
}
