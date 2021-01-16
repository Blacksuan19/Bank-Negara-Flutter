import 'package:bank_flutter/screens/admin.dart';
import 'package:bank_flutter/screens/customer.dart';
import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // avoid overflow
      appBar: makeAppBar(context, widget.title),
      body: Center(
        heightFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select UI",
              style: TextStyles.headline3(context),
            ),
            SizedBox(
              height: Spacing.m(context),
            ),
            makeRaisedButton(
              context,
              "Customer",
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Customer(),
                  ),
                ),
              },
              color: Colors.redAccent,
            ),
            SizedBox(
              height: Spacing.s(context),
            ),
            makeRaisedButton(
              context,
              "Admin",
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admin(),
                  ),
                ),
              },
              color: Colors.blue[400],
            ),
          ],
        ),
      ),
    );
  }
}
