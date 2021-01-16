import 'package:flutter/material.dart';

// custom text style to match the website theme
class TextStyles {
  static TextStyle headline1(context) {
    return Theme.of(context).textTheme.headline1.copyWith(color: Colors.red);
  }

  static TextStyle headline2(context) {
    return Theme.of(context).textTheme.headline2.copyWith(color: Colors.red);
  }

  static TextStyle headline3(context) {
    return Theme.of(context).textTheme.headline3.copyWith(color: Colors.red);
  }

  static TextStyle headline4(context) {
    return Theme.of(context).textTheme.headline4.copyWith(color: Colors.red);
  }

  static TextStyle headline5(context) {
    return Theme.of(context).textTheme.headline5.copyWith(color: Colors.red);
  }

  static TextStyle headline6(context) {
    return Theme.of(context).textTheme.headline6.copyWith(color: Colors.red);
  }
}

// dynamic spacing depeding on screen size
class Spacing {
  static double xl(context) {
    return MediaQuery.of(context).size.height * 0.2;
  }

  static double l(context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  static double m(context) {
    return MediaQuery.of(context).size.height * 0.07;
  }

  static double s(context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double sm(context) {
    return MediaQuery.of(context).size.height * 0.03;
  }
}
