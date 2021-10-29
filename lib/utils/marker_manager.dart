import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:biobuluyo_app/models/expense.dart';

import 'package:biobuluyo_app/main.dart';
import 'package:biobuluyo_app/pages/details.dart';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  int markerId = 0;

  final List<Marker> currentMarkerList = [];
  Marker? marker;
  LatLng? latLng;

  void addCurrentMarker(LatLng latlng) {
    marker = Marker(
      markerId: const MarkerId(""),
      position: latlng,
    );
    latLng = latlng;
    currentMarkerList.add(marker!);
    notifyListeners();
  }

  void addMarker(Marker marker) {
    markersList.add(marker);
    notifyListeners();
  }

  void addMarkers(List expenseList) {
    markersList.clear();
    for (ExpenseModel expenseModel in expenseList) {
      if (expenseModel.latLng != null) {
        var id = markersList.length;
        var marker = Marker(
            markerId: MarkerId("$id"),
            position: expenseModel.latLng!,
            onTap: () {
              markerId = expenseList.indexOf(expenseModel);
              Navigator.push(navigatorKey.currentState!.context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()));
            });
        addMarker(marker);
      }
    }
  }

  void setExpenseLocation({required expense, LatLng? location}) {
    expense.latLng = location;
    currentMarkerList.clear();
  }
}
