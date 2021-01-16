import 'package:bank_flutter/transaction.dart';
import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/widgets/common.dart';
import 'package:flutter/material.dart';

class AboveTrans extends StatefulWidget {
  const AboveTrans();
  @override
  _AboveTransState createState() => _AboveTransState();
}

class _AboveTransState extends State<AboveTrans> {
  var trans = getTrans();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // only return tranaction above the threshold limit of 10
        if (trans[index].amount >= 10) {
          return makeTransWidget(context, trans, index);
        } else
          return null;
      },
      itemCount: trans.length,
      padding: EdgeInsets.fromLTRB(
        Spacing.sm(context) * 0.5,
        Spacing.sm(context),
        Spacing.sm(context) * 0.5,
        0,
      ),
    );
  }
}
