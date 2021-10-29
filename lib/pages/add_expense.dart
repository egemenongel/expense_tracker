import 'package:biobuluyo_app/widgets/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/add_marker.dart';
import 'package:biobuluyo_app/pages/home.dart';

import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class AddExpensePage extends StatelessWidget {
  AddExpensePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController? _dateController = TextEditingController();
  ExpenseModel _createExpense() {
    return ExpenseModel(
      description: _descriptionController.text,
      cost: int.parse(_costController.text),
      date: DateTime.parse(_dateController!.text),
      category: _categoryController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListManager>(context, listen: false);

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
          ExpenseForm(
            description: _descriptionController,
            cost: _costController,
            category: _categoryController,
            date: _dateController,
            formKey: _formKey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _createExpense();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddMarkerPage(
                                      expense: _createExpense(),
                                    )));
                      }
                    },
                    child: const Text("Add Location"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        )),
        extendedPadding: const EdgeInsets.all(150.0),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _expenseListModel.addExpense(_createExpense());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        label: const Text("Submit"),
      ),
    );
  }
}
