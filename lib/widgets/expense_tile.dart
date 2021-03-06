import 'package:biobuluyo_app/utils/expense_list_manager.dart';
import 'package:biobuluyo_app/pages/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListManager>(context, listen: false);
    var _expense = _expenseListModel.expenseList[index];
    return Slidable(
      child: ListTile(
        leading: _expense.latLng != null
            ? const Icon(Icons.location_on)
            : const SizedBox(),
        title: Row(
          children: [
            Text("${_expense.description} "),
            const Expanded(child: SizedBox()),
            Text("${_expense.cost} TL"),
          ],
        ),
        subtitle: Row(
          children: [
            Text(_expense.date.toString().substring(0, 10)),
            const Expanded(child: SizedBox()),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "${_expense.category}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
      actionPane: const SlidableScrollActionPane(),
      actionExtentRatio: 0.20,
      actions: [
        IconSlideAction(
          caption: "Edit",
          icon: Icons.edit,
          color: Colors.blue,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage(
                          index: index,
                        )));
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: "Remove",
          icon: Icons.remove,
          color: Colors.red,
          onTap: () => _expenseListModel.removeExpense(index),
        ),
      ],
    );
  }
}
