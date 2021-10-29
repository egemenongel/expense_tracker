import 'package:biobuluyo_app/utils/form_validation.dart';
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
                    validator: (value) => FormValidation.type(value),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    validator: (value) => FormValidation.empty(value),
                  ),
                  TextFormField(
                    controller: categoryController,
                    validator: (value) => FormValidation.empty(value),
                  ),
                  DateField(
                      controller: dateController,
                      validation: FormValidation.empty),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    child: const Text("Edit"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _expenseListStore.editExpense(
                            index: index,
                            cost: int.parse(costController.text),
                            description: descriptionController.text,
                            category: categoryController.text,
                            date: DateTime.parse(dateController.text));
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
