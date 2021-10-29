import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class ExpenseByCategoryPage extends StatelessWidget {
  const ExpenseByCategoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListManager>(context, listen: false);
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: _expenseListModel.expenseByCategoryList.length,
        itemBuilder: (BuildContext context, int index) {
          var expense = _expenseListModel.expenseByCategoryList[index];
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
