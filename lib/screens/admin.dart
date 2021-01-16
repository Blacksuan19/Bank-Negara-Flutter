import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/utils.dart';
import 'package:bank_flutter/widgets.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  double ethBal = 100.0;
  double bankBal = 488549.7045; // 100 * 488549.7045
  double thres = 10;
  final amountController = TextEditingController();

  void setThreshold() {
    setState(() {
      if (amountController.text != "") {
        thres = double.parse(amountController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // avoid overflow
      appBar: makeAppBar(context, "Admin"),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          heightFactor: 1,
          child: Column(
            children: [
              Text(
                'Balance',
                style: TextStyles.headline5(context),
              ),
              Text(
                formatter.format(bankBal),
                style: TextStyles.headline2(context),
              ),
              Text(
                '$ethBal ETH',
                style: TextStyles.headline5(context),
              ),
              SizedBox(
                height: Spacing.m(context),
              ),
              Text(
                'Threshold',
                style: TextStyles.headline6(context),
              ),
              Text(
                '$thres ETH',
                style: TextStyles.headline3(context),
              ),
              SizedBox(
                height: Spacing.l(context),
              ),
              makeInputField(amountController),
              SizedBox(
                height: Spacing.s(context),
              ),
              makeRaisedButton(context, "Update Threshold", setThreshold)
            ],
          ),
        ),
      ),
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
      ),
    );
  }
}
