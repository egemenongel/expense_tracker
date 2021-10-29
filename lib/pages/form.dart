import 'package:biobuluyo_app/widgets/date_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/add_marker.dart';
import 'package:biobuluyo_app/pages/home.dart';
import 'package:biobuluyo_app/utils/form_validation.dart';

import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
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
                    decoration: InputDecoration(
                      border: _border,
                      labelText: "Cost",
                    ),
                    controller: costController,
                    keyboardType: TextInputType.number,
                    validator: (value) => FormValidation.type(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: _border,
                    ),
                    controller: descriptionController,
                    validator: (value) => FormValidation.empty(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: _border,
                    ),
                    controller: categoryController,
                    validator: (value) => FormValidation.empty(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DateField(
                    controller: dateController,
                    validation: FormValidation.empty,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
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
                            child: const Text("Add Location")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          )
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
