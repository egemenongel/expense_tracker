import 'package:biobuluyo_app/pages/add_marker.dart';
import 'package:biobuluyo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../marker_manager.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

// MAYBE CONVERT TO STATELESS
class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: true);
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);
    // var _expenseModel = Provider.of<ExpenseModel>(context, listen: true);
    TextEditingController descriptionController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController? dateController = TextEditingController();

    // LatLng? _getLocation() {
    //   if (_expenseModel.location != null) {
    //     return _expenseModel.location;
    //   }
    //   return LatLng(0, 0);
    // }

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
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: "",
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => dateController.text = val,
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => dateController.text = val!,
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
                controller: descriptionController,
                keyboardType: TextInputType.name,
              ),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: "Date"),
              //   controller: dateController,
              //   keyboardType: TextInputType.datetime,
              // ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Category"),
                controller: categoryController,
              ),
              // Text(_expenseModel.getLocation().toString()),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MarkerPage())),
                  child: const Text("Add Location")),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    ExpenseModel expenseModel = ExpenseModel(
                      description: descriptionController.text,
                      cost: int.parse(costController.text),
                      date: DateTime.parse(dateController.text),
                      category: categoryController.text,
                      location: _markerManager.location.toString(),
                    );
                    _expenseListModel.addExpense(expenseModel);
                    _expenseListModel.totalExpense +=
                        int.parse(costController.text);
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
