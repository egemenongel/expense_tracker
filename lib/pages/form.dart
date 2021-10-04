import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/add_marker.dart';
import 'package:biobuluyo_app/pages/home.dart';

import '../marker_manager.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: true);
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);
    TextEditingController descriptionController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController? dateController = TextEditingController();

    void _sendForm() {
      ExpenseModel expenseModel = ExpenseModel(
        description: descriptionController.text,
        cost: int.parse(costController.text),
        date: DateTime.parse(dateController.text),
        category: categoryController.text,
        location: _markerManager.location.toString(),
      );
      _expenseListModel.addExpense(expenseModel);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
      ),
      body: Form(
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
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
                controller: descriptionController,
                keyboardType: TextInputType.name,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Category"),
                controller: categoryController,
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: "",
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
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    _sendForm();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MarkerPage()));
                  },
                  child: const Text("Add Location")),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    _sendForm();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
