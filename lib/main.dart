import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/utils.dart';
import 'package:bank_flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Bank Negara',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHomePage(title: 'Bank Negara'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  double _balance = 0.0;
  double _balEther = 0;
  var rate = fetchRate();
  final amountController = TextEditingController();
  final formatter = NumberFormat.currency(locale: 'en_MY', name: "RM ");

  void deposit() async {
    double _rate = await rate;
    setState(() {
      if (amountController.text != '') {
        _balEther += double.parse(amountController.text);
        _balance = _balEther * _rate;
      }
    });
  }

  void withdraw() async {
    double _rate = await rate;
    setState(() {
      if (amountController.text != '') {
        if (double.parse(amountController.text) < _balEther) {
          _balEther -= double.parse(amountController.text);
          _balance = _balEther * _rate;
        } else {
          showSimpleNotification(Text("Not Enough Balance to Withdraw"),
              background: Colors.red,
              duration: Duration(seconds: 3),
              position: NotificationPosition.bottom);
        }
      }
    });
  }

  // change status bar colors after state change
  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.red);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // set status bar colors on start
    FlutterStatusbarcolor.setStatusBarColor(Colors.red);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0, // no shadows
      ),
      body: Column(
        children: [
          Center(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text("ETH"),
                          ),
                          hintText: "Enter Amount"),
                      textAlign: TextAlign.left,
                      controller: amountController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
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
                    color: Color.fromARGB(255, 16, 185, 129),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
