class StockData {
  final String ticker;
  final String shortName, longName;
  final double regularMarketChangePercent, regularMarketChange, regularMarketPrice;
  final int? marketCap;

  StockData({
    required this.ticker,
    required this.shortName,
    required this.longName,
    required this.regularMarketChangePercent,
    required this.regularMarketChange,
    required this.regularMarketPrice,
    this.marketCap,
  });

  factory StockData.fromJson(Map<String, dynamic> jsonMap) =>
      StockData(
        ticker: jsonMap['symbol'],
        shortName: jsonMap['shortName'],
        longName: jsonMap['longName'],
        regularMarketChangePercent: jsonMap['regularMarketChangePercent'],
        regularMarketChange: jsonMap['regularMarketChange'],
        regularMarketPrice: jsonMap['regularMarketPrice'],
        marketCap: jsonMap['marketCap'],
      );

  factory StockData.fromJsonWithName(String ticker, Map<String, dynamic> jsonMap) =>
      StockData(
        ticker: ticker,
        shortName: jsonMap['shortName'],
        longName: jsonMap['longName'],
        regularMarketChangePercent: jsonMap['regularMarketChangePercent'],
        regularMarketChange: jsonMap['regularMarketChange'],
        regularMarketPrice: jsonMap['regularMarketPrice'],
        marketCap: jsonMap['marketCap'],
      );

  @override
  String toString() {
    return 'StockData{ticker: $ticker, shortName: $shortName, longName: $longName, regularMarketChangePercent: $regularMarketChangePercent, regularMarketChange: $regularMarketChange, regularMarketPrice: $regularMarketPrice, marketCap: $marketCap}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StockData &&
              runtimeType == other.runtimeType &&
              ticker == other.ticker;

  @override
  int get hashCode => ticker.hashCode;
}