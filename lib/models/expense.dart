import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

class ExpenseModel extends ChangeNotifier {
  String? description;
  int? cost;
  DateTime? date; //VARIABLE SHOULD BE IN TIME
  String? category;
  String? location;

  ExpenseModel({
    this.description,
    this.cost,
    this.date,
    this.category,
    this.location,
  });

  setLocation(String location) {
    this.location = location;
  }

  getLocation() {
    return location;
  }
}
