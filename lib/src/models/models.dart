class StockSearchResult {
  final int count;
  final List<StockQuote> stockQuotes;

  StockSearchResult(
    this.stockQuotes,
    this.count,
  );

  factory StockSearchResult.fromJson(Map<String, dynamic> jsonMap) {
    final List<StockQuote> quotes = List.from(jsonMap['quotes'].map((e) => StockQuote.fromJson(e)));
    return StockSearchResult(quotes, jsonMap['count']);
  }

  @override
  String toString() {
    return 'StockSearchResult{count: $count, stockQuotes: $stockQuotes}';
  }
}

class StockQuote {
  final String exchange, exchangeDisplay;
  final String symbol;
  final String longName, shortName;
  final String sector;
  final String industry;

  StockQuote({
    required this.symbol,
    required this.exchange,
    required this.exchangeDisplay,
    required this.shortName,
    required this.longName,
    required this.sector,
    required this.industry,
  });

  factory StockQuote.fromJson(Map<String, dynamic> jsonMap) {
    return StockQuote(
      symbol: jsonMap['symbol'],
      exchange: jsonMap['exchange'],
      exchangeDisplay: jsonMap['exchDisp'],
      longName: jsonMap['longname'],
      shortName: jsonMap['shortname'],
      sector: jsonMap['sector'],
      industry: jsonMap['industry'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockQuote &&
          runtimeType == other.runtimeType &&
          exchange == other.exchange &&
          exchangeDisplay == other.exchangeDisplay &&
          symbol == other.symbol;

  @override
  int get hashCode =>
      exchange.hashCode ^ exchangeDisplay.hashCode ^ symbol.hashCode;

  @override
  String toString() {
    return 'StockQuote{exchange: $exchange, exchangeDisplay: $exchangeDisplay, symbol: $symbol, longName: $longName, shortName: $shortName, sector: $sector, industry: $industry}';
  }
}

class StockData {
  final String ticker;
  final String shortName, longName;
  final double regularMarketChangePercent,
      regularMarketChange,
      regularMarketPrice;
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

  factory StockData.fromJson(Map<String, dynamic> jsonMap) => StockData(
        ticker: jsonMap['symbol'],
        shortName: jsonMap['shortName'],
        longName: jsonMap['longName'],
        regularMarketChangePercent: jsonMap['regularMarketChangePercent'],
        regularMarketChange: jsonMap['regularMarketChange'],
        regularMarketPrice: jsonMap['regularMarketPrice'],
        marketCap: jsonMap['marketCap'],
      );

  factory StockData.fromJsonWithName(
    String ticker,
    Map<String, dynamic> jsonMap,
  ) =>
      StockData(
        ticker: ticker.toUpperCase(),
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
