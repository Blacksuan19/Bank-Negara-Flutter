import 'package:bank_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18),
      ),
    ),
  );
}

AppBar makeAppBar(context, title) {
  return AppBar(
    title: Text(title,
        style: TextStyles.headline5(context).copyWith(
          color: Colors.white,
        )),
    centerTitle: true,
    elevation: 0, // no shadows
    brightness:
        Brightness.dark, // dark brightness will make the statusbar icons white
    backgroundColor: Colors.red,
  );
}

Padding makeInputField(controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100),
    child: TextField(
      decoration: InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Text("ETH"),
        ),
        hintText: "Enter Amount",
      ),
      textAlign: TextAlign.left,
      controller: controller,
      // only numbers are allowed
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    ),
  );
}

Column makeTransWidget(context, trans, index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${trans[index].account}',
                style: TextStyles.headline7(context).copyWith(
                  color: Colors.black,
                ),
              ),
              Text('${trans[index].timestamp}'),
            ],
          ),
          Text(
            '${trans[index].amount} ETH',
            style: TextStyles.headline6(context),
          ),
        ],
      ),
      SizedBox(
        height: Spacing.s(context),
      ),
    ],
  );
}
