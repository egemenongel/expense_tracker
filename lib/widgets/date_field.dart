import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key, required this.controller, this.validation})
      : super(key: key);
  final TextEditingController controller;
  final Function? validation;
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'd MMM, yyyy',
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: const Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Hour",
      controller: controller,
      onChanged: (val) => controller.text = val,
      validator: (value) => validation!(value),
    );
  }
}
