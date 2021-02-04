import 'package:bank_flutter/models/balance.dart';
import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_riverpod/all.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  // input text field controller
  final amountController = TextEditingController();

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
              Consumer(builder: (context, watch, child) {
                var bal = watch(balanceProvider);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatter.format(bal.balance),
                      style: TextStyles.headline2(context),
                    ),
                    Text(
                      '${bal.ethBalance} ETH',
                      style: TextStyles.headline5(context),
                    ),
                  ],
                );
              }),
              SizedBox(
                height: Spacing.xl(context),
              ),
              makeInputField(amountController),
              SizedBox(
                height: Spacing.l(context),
              ),
              makeRaisedButton(context, "Deposit", () {
                setState(() {
                  if (amountController.text.isNotEmpty) {
                    context.read(balanceProvider).add(amountController.text);
                  }
                });
              }),
              SizedBox(
                height: Spacing.m(context),
              ),
              makeRaisedButton(
                context,
                "Withdraw",
                () {
                  setState(() {
                    // make sure text field is not empty
                    final bal = context.read(balanceProvider);
                    var cont = amountController.text;
                    if (cont.isNotEmpty) {
                      // make sure there is enough balance
                      if (double.parse(cont) <= bal.ethBalance) {
                        bal.sub(cont);
                      } else {
                        // snackbar if not enough balance
                        showSimpleNotification(
                            Text("Not Enough Balance to Withdraw"),
                            background: Colors.red,
                            duration: Duration(seconds: 3),
                            position: NotificationPosition.bottom);
                      }
                    }
                  });
                },
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
