import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExpenseModel extends ChangeNotifier {
  String? description;
  int? cost;
  DateTime? date;
  String? category;
  LatLng? latLng;

  ExpenseModel({
    this.description,
    this.cost,
    this.date,
    this.category,
    this.latLng,
  });
}
