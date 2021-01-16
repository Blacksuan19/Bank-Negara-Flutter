import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// fetch and return MYR exchange rate
Future<double> fetchRate() async {
  var url = 'https://api.coinbase.com/v2/exchange-rates?currency=ETH';
  var response = await http.get(url);
  var jsonResponse = convert.jsonDecode(response.body);
  var rate = double.parse(jsonResponse['data']['rates']['MYR']);
  return rate;
}
