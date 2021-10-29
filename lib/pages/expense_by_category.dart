import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class ExpenseByCategoryPage extends StatelessWidget {
  const ExpenseByCategoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _expenseListManager =
        Provider.of<ExpenseListManager>(context, listen: false);
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: _expenseListManager.expenseByCategoryList.length,
        itemBuilder: (BuildContext context, int index) {
          var expense = _expenseListManager.expenseByCategoryList[index];
          return ListTile(
            title: Text(
              "${expense.cost}",
            ),
          );
        },
      ),
    ));
  }
}
