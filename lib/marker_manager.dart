import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  var location;

  var currentMarker;
  late var rnd = Random().nextInt(360);

  handleTap(LatLng latLng) {
    location = latLng;
    addMarker();
    notifyListeners();
  }

  addMarker() {
    markersList.add(currentMarker);

    notifyListeners();
  }
}
