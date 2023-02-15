library yahoo_fin_api;

import 'dart:convert';

import 'package:yahoo_fin_api/src/helpers/helper_functions.dart';
import 'package:yahoo_fin_api/src/models/exception.dart';
import 'package:yahoo_fin_api/src/secret.dart';
import 'package:yahoo_fin_api/yahoo_fin_api.dart';
import 'package:http/http.dart' as http;

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