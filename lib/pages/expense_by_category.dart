import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseByCategory extends StatelessWidget {
  const ExpenseByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: false);
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: _expenseListModel.expenseByCategoryList.length,
        itemBuilder: (BuildContext context, int index) {
          var expenseList = _expenseListModel.expenseByCategoryList;
          return ListTile(
            title: Text(
              "${expenseList[index].cost}",
            ),
          );
        },
      ),
    ));
  }
}
