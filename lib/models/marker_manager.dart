import 'package:biobuluyo_app/main.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/pages/details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  int markerId = 0;

  addMarker(Marker marker) {
    markersList.add(marker);
    notifyListeners();
  }

  addMarkers(List expenseList) {
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
}