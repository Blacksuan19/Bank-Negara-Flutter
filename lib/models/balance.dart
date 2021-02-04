import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

// fetch and return MYR exchange rate
Future<double> fetchRate() async {
  var url = 'https://api.coinbase.com/v2/exchange-rates?currency=ETH';
  var response = await http.get(url);
  var jsonResponse = convert.jsonDecode(response.body);
  var rate = double.parse(jsonResponse['data']['rates']['MYR']);
  return rate;
}

// for formatting to currency
final formatter = NumberFormat.currency(locale: 'en_MY', name: "RM ");

class Balance extends ChangeNotifier {
  double balance = 0;
  double ethBalance = 0;
  var rate = fetchRate();

  void add(amount) async {
    var _rate = await rate;
    ethBalance += double.parse(amount);
    balance = ethBalance * _rate;
    notifyListeners();
  }

  void sub(amount) async {
    var _rate = await rate;
    ethBalance -= double.parse(amount);
    balance = ethBalance * _rate;
    notifyListeners();
  }
}

// provider for balance value
final ChangeNotifierProvider<Balance> balanceProvider =
    ChangeNotifierProvider((ref) {
  return Balance();
});
