import 'package:bank_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  @override
  // change statusbar color on widget change
  didChangeAppLifecycleState(AppLifecycleState state) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.red);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    // set status bar colors on start
    FlutterStatusbarcolor.setStatusBarColor(Colors.red);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    // wrap whole app in overlay support to enable support for snackbar
    return OverlaySupport(
      child: MaterialApp(
        title: 'Bank Negara',
        debugShowCheckedModeBanner: false, // hidce debug thing on top right
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Home(title: 'Bank Negara'),
      ),
    );
  }
}
