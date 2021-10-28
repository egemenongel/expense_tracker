import 'package:biobuluyo_app/widgets/date_field.dart';
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
    var _selectedItem = _expenseListStore.expenseList[index];
    final _formKey = GlobalKey<FormState>();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    descriptionController.text = _selectedItem.description!;
    costController.text = _selectedItem.cost.toString();
    categoryController.text = _selectedItem.category!;
    dateController.text = _selectedItem.date.toString();

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
