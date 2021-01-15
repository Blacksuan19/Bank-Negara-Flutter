import 'package:bank_flutter/theme.dart';
import 'package:flutter/material.dart';

FractionallySizedBox makeRaisedButton(context, label, onPresses,
    {color = Colors.red}) {
  return FractionallySizedBox(
    widthFactor: 0.7,
    child: MaterialButton(
      onPressed: onPresses,
      color: color,
      textColor: Colors.white,
      child: Text(
        label,
        style: TextStyles.headline5(context).copyWith(color: Colors.white),
      ),
      elevation: 3.0,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 150.0),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18),
      ),
    ),
  );
}
