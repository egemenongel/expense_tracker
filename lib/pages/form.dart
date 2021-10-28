import 'package:biobuluyo_app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/add_marker.dart';
import 'package:biobuluyo_app/pages/home.dart';

import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: false);
    final _formKey = GlobalKey<FormState>();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController? dateController = TextEditingController();

    ExpenseModel _createExpense() {
      ExpenseModel expenseModel = ExpenseModel(
        description: descriptionController.text,
        cost: int.parse(costController.text),
        date: DateTime.parse(dateController.text),
        category: categoryController.text,
      );
      return expenseModel;
    }

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
        title: const Text("Add Expense"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Cost"),
                    controller: costController,
                    keyboardType: TextInputType.number,
                    validator: (value) => _costValidation(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Description"),
                    controller: descriptionController,
                    validator: (value) => _validation(value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Category"),
                    controller: categoryController,
                    validator: (value) => _validation(value),
                  ),
                  DateField(
                    controller: dateController,
                    validation: _validation,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _createExpense();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarkerPage(
                                        expense: _createExpense(),
                                      )));
                        }
                      },
                      child: const Text("Add Location")),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _expenseListModel.addExpense(_createExpense());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      }),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
