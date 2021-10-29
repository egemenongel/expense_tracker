import 'package:biobuluyo_app/utils/expense_list_manager.dart';
import 'package:biobuluyo_app/widgets/expense_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseListManager>(builder: (_, expenseListManager, ___) {
      return ListView.separated(
        itemCount: expenseListManager.expenseList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
          height: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ExpenseTile(
            index: index,
          );
        },
      );
    });
  }
}
