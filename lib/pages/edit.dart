import 'package:biobuluyo_app/widgets/expense_form.dart';
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
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _costController = TextEditingController();
    TextEditingController _categoryController = TextEditingController();
    TextEditingController _dateController = TextEditingController();
    _descriptionController.text = _selectedItem.description!;
    _costController.text = _selectedItem.cost.toString();
    _categoryController.text = _selectedItem.category!;
    _dateController.text = _selectedItem.date.toString();

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Edit Expense",
      )),
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
                      child: const Text("Edit"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _expenseListStore.editExpense(
                              index: index,
                              cost: int.parse(_costController.text),
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
