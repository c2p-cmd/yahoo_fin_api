import 'package:flutter_test/flutter_test.dart';

import 'package:yahoo_fin_api/yahoo_fin_api.dart';

void main() {
  test('gets stock data!', () async {
    final stockData = await getData(ticker: "RBA.NS");
    expect(stockData.shortName, "RESTAURANT BRAND ASIA LTD");
  });
}
