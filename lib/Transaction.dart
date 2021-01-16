import 'package:flutter/material.dart';

// make dummy transaction data
// yes its all copy pasted of the same row
// yes i cant think of random data
// si
class Transaction {
  @required
  String account;
  @required
  double amount;
  @required
  String timestamp;
  Transaction(this.account, this.amount, this.timestamp);
}

List<Transaction> getTrans() {
  List<Transaction> trans = [
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      23,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x298987948021943913242134238",
      45,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      24,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      45,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      14,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      3,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      2.78,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
    new Transaction(
      "0x2323490348021943913242134238",
      20,
      "15/01/2021 13:42:34 PM",
    ),
  ];
  return trans;
}
