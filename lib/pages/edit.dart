import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListStore =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _index = _expenseListStore.listIndex;
    var _expenseList = _expenseListStore.expenseList;
    TextEditingController descriptionController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController? dateController = TextEditingController();
    descriptionController.text = _expenseList[_index].description!;
    costController.text = _expenseList[_index].cost.toString();
    categoryController.text = _expenseList[_index].category.toString();
    dateController.text = _expenseList[_index].date.toString();
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Edit Expense",
        )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: descriptionController,
              ),
              TextFormField(
                controller: costController,
              ),
              TextFormField(
                controller: categoryController,
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: dateController.text,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: const Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                onChanged: (val) => dateController.text = val,
                validator: (val) {
                  return null;
                },
                onSaved: (val) => dateController.text = val!,
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                child: const Text("Edit"),
                onPressed: () {
                  ExpenseModel expenseModel = ExpenseModel(
                    description: descriptionController.text,
                    cost: int.parse(costController.text),
                    date: DateTime.parse(dateController.text),
                    category: categoryController.text,
                  );
                  _expenseListStore.editExpense(_index, expenseModel);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
