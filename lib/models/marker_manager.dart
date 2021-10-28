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
  addCurrentMarker(LatLng latlng) {
    marker = Marker(
      // icon:
      //     BitmapDescriptor.defaultMarkerWithHue((_randomColor.toDouble())),
      markerId: const MarkerId(""),
      position: latlng,
    );
    latLng = latlng;
    currentMarkerList.add(marker!);
    notifyListeners();
  }

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
                  MaterialPageRoute(builder: (context) => DetailsPage()));
            });
        addMarker(marker);
      }
    }
  }
}
