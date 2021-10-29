import 'package:biobuluyo_app/utils/form_validation.dart';
import 'package:biobuluyo_app/widgets/date_field.dart';
import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  ExpenseForm({
    Key? key,
    required this.description,
    required this.cost,
    required this.category,
    required this.date,
    required this.formKey,
  }) : super(key: key);
  final TextEditingController? description;
  final TextEditingController? cost;
  final TextEditingController? category;
  final TextEditingController? date;
  final Key? formKey;
  final OutlineInputBorder _formInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: _formInputBorder,
                labelText: "Cost",
              ),
              controller: cost,
              keyboardType: TextInputType.number,
              validator: (value) => FormValidation.type(value),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Description",
                border: _formInputBorder,
              ),
              controller: description,
              validator: (value) => FormValidation.empty(value),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Category",
                border: _formInputBorder,
              ),
              controller: category,
              validator: (value) => FormValidation.empty(value),
            ),
            const SizedBox(
              height: 20,
            ),
            DateField(
              controller: date!,
              validation: FormValidation.empty,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
