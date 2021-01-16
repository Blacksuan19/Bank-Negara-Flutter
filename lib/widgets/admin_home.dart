import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/utils.dart';
import 'package:bank_flutter/widgets/common.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  // const constructor required for _widgetOptions
  const AdminHome();
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  double ethBal = 100.0;
  double bankBal = 488549.7045; // 100 * 488549.7045
  double thres = 10;
  final amountController = TextEditingController();

  // set threshold value
  void setThreshold() {
    setState(() {
      if (amountController.text != "") {
        thres = double.parse(amountController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
