const apiUrl = 'https://query1.finance.yahoo.com/v7/finance/quote?symbols=';
String searchUrl(String symbol) =>
    'https://query2.finance.yahoo.com/v1/finance/search?q=$symbol&region=IN&newsCount=0';
Uri searchUri(String symbol) => Uri.parse(searchUrl(symbol));

const baseUrl = 'query2.finance.yahoo.com';
const path = '/v1/finance/search';