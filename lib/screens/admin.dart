import 'package:bank_flutter/widgets/Above_limit_trasnactions.dart';
import 'package:bank_flutter/widgets/admin_home.dart';
import 'package:bank_flutter/widgets/common.dart';
import 'package:bank_flutter/widgets/suspected_accounts.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _selectedIndex = 0; // tab nabigation
  // widgets to load for each tab index
  static const List<Widget> _widgetOptions = <Widget>[
    AdminHome(),
    SuspectedTab(),
    AboveTrans(),
  ];

  // tab navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // avoid overflow
      appBar: makeAppBar(context, "Admin"),
      // set body widget according to selected tab index
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Suspected Accounts",
            icon: Icon(Icons.account_balance),
          ),
          BottomNavigationBarItem(
            label: "Above Limit Transactions",
            icon: Icon(Icons.lock_open),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
