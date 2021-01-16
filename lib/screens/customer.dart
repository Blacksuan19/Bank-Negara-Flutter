import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/utils.dart';
import 'package:bank_flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  double _balance = 0.0;
  double _balEther = 0;
  // get exchange rate (its faster this way than awaiting fetchRate)
  var rate = fetchRate();
  // input text field controller
  final amountController = TextEditingController();

  // deposit (just works with _balance)
  void deposit() async {
    double _rate = await rate;
    setState(() {
      if (amountController.text != '') {
        _balEther += double.parse(amountController.text);
        _balance = _balEther * _rate;
      }
    });
  }

  // withdraw (just works with _balance)
  void withdraw() async {
    double _rate = await rate;
    setState(() {
      // make sure text field is not empty
      if (amountController.text != '') {
        // make sure there is enough balance
        if (double.parse(amountController.text) < _balEther) {
          _balEther -= double.parse(amountController.text);
          _balance = _balEther * _rate;
        } else {
          // snackbar if not enough balance
          showSimpleNotification(Text("Not Enough Balance to Withdraw"),
              background: Colors.red,
              duration: Duration(seconds: 3),
              position: NotificationPosition.bottom);
        }
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // avoid overflow
      appBar: makeAppBar(context, "Customer"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Balance',
                style: TextStyles.headline5(context),
              ),
              Text(
                formatter.format(_balance),
                style: TextStyles.headline2(context),
              ),
              Text(
                '$_balEther ETH',
                style: TextStyles.headline5(context),
              ),
              SizedBox(
                height: Spacing.xl(context),
              ),
              makeInputField(amountController),
              SizedBox(
                height: Spacing.l(context),
              ),
              makeRaisedButton(context, "Deposit", deposit),
              SizedBox(
                height: Spacing.m(context),
              ),
              makeRaisedButton(
                context,
                "Withdraw",
                withdraw,
                // same color from website
                color: Color.fromARGB(255, 16, 185, 129),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
