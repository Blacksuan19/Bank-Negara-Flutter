import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

// fetch and return MYR exchange rate
Future<double> fetchRate() async {
  var url = 'https://api.coinbase.com/v2/exchange-rates?currency=ETH';
  var response = await http.get(url);
  var jsonResponse = convert.jsonDecode(response.body);
  var rate = double.parse(jsonResponse['data']['rates']['MYR']);
  print(rate);
  return rate;
}

// for formatting to currency
final formatter = NumberFormat.currency(locale: 'en_MY', name: "RM ");
