import 'package:bank_flutter/transaction.dart';
import 'package:bank_flutter/theme.dart';
import 'package:bank_flutter/widgets/common.dart';
import 'package:flutter/material.dart';

class SuspectedTab extends StatefulWidget {
  const SuspectedTab();

  @override
  _SuspectedTabState createState() => _SuspectedTabState();
}

class _SuspectedTabState extends State<SuspectedTab> {
  var trans = getTrans();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return makeTransWidget(context, trans, index);
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
