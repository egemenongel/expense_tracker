import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'main.dart';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  var location;
  var currentMarker;
  bool canPush = false;

  handleTap(LatLng latLng) {
    location = latLng;
    addMarker();
    notifyListeners();
  }

  addMarker() {
    canPush = true;
    markersList.add(currentMarker);
    // markersList.add(trialFunction());
    notifyListeners();
  }

  // Marker trialFunction() {
  //   return Marker(
  //       markerId: const MarkerId(""),
  //       position: location, // Same location, different marker.
  //       onTap: () {
  //         Navigator.pushNamed(navigatorKey.currentState!.context, "/FormPage");
  //       });
  // }
}
