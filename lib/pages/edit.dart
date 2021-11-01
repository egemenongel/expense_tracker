import 'package:biobuluyo_app/widgets/app_bar.dart';
import 'package:biobuluyo_app/widgets/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key, required this.index}) : super(key: key);
  final int index;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _expenseListManager =
        Provider.of<ExpenseListManager>(context, listen: false);
    void _setInitialValues() {
      var _selectedItem = _expenseListManager.expenseList[index];
      _descriptionController.text = _selectedItem.description!;
      _costController.text = _selectedItem.cost.toString();
      _categoryController.text = _selectedItem.category!;
      _dateController.text = _selectedItem.date.toString();
    }

    _setInitialValues();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Edit Expense",
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
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _expenseListManager.editExpense(
                              index: index,
                              cost: double.parse(_costController.text),
                              description: _descriptionController.text,
                              category: _categoryController.text,
                              date: DateTime.parse(_dateController.text));
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
