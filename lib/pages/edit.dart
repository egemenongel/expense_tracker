import 'package:biobuluyo_app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    var _expenseListStore =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _expenseList = _expenseListStore.expenseList;
    final _formKey = GlobalKey<FormState>();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    descriptionController.text = _expenseList[index].description!;
    costController.text = _expenseList[index].cost.toString();
    categoryController.text = _expenseList[index].category.toString();
    dateController.text = _expenseList[index].date.toString();

    String? _costValidation(String? value) {
      if (value!.isEmpty) {
        return "This field cannot be empty";
      } else if (double.tryParse(value) == null) {
        return "Please type a number";
      }
    }

    String? _validation(String? value) {
      if (value!.isEmpty) {
        return "This field cannot be empty";
      }
    }

    // void _editForm() {
    //   ExpenseModel expenseModel = ExpenseModel(
    //     description: descriptionController.text,
    //     cost: int.parse(costController.text),
    //     date: DateTime.parse(dateController.text),
    //     category: categoryController.text,
    //   );
    //   _expenseListStore.editExpense(index, expenseModel);
    // }

    // void edit() {
    //   _expenseList[index].cost = 3;
    // }

    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Edit Expense",
        )),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: costController,
                    validator: (value) => _costValidation(value),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    validator: (value) => _validation(value),
                  ),
                  TextFormField(
                    controller: categoryController,
                    validator: (value) => _validation(value),
                  ),
                  DateField(
                      controller: dateController, validation: _validation),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    child: const Text("Edit"),
                    onPressed: () {
                      _expenseListStore.editExpense(
                          index: index,
                          cost: int.parse(costController.text),
                          description: descriptionController.text,
                          category: categoryController.text,
                          date: DateTime.parse(dateController.text));
                      Navigator.pop(context);
                      // if (_formKey.currentState!.validate()) {
                      //   // _editForm();
                      //   Navigator.pop(context);
                      // }
                    },
                  )
                ],
              ),
            )));
  }
}
