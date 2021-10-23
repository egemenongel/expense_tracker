import 'package:flutter/cupertino.dart';

class ExpenseModel extends ChangeNotifier {
  String? description;
  int? cost;
  DateTime? date;
  String? category;
  String? location;
  String? marker;

  ExpenseModel({
    this.description,
    this.cost,
    this.date,
    this.category,
    this.marker,
  });
}
