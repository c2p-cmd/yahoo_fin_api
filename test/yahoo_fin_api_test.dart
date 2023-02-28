import 'package:flutter_test/flutter_test.dart';

import 'package:yahoo_fin_api/yahoo_fin_api.dart';

void main() {
  test('gets stock data!', () async {
    final stockSearch = await searchForStock(ticker: 'idea');
    expect(stockSearch.stockQuotes.any((element) => element.shortName.contains('VODAFONE')), true);

    final stockData = await getData(ticker: "RBA.NS");
    expect(stockData.shortName, "RESTAURANT BRAND ASIA LTD");

    final result = await getMultipleStocks(["RBA.ns", 'adaniports.ns', 'MCLEODRUSS.ns', 'reliance.bo']);
    expect(result.length, 4);
  });
}
