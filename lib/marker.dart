import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  var location;
  var id = 0;

  var rnd = Random();

  // late var randomColor = rnd.nextInt(360);
  handleTap(LatLng latLng) {
    location = latLng;
    notifyListeners();
  }

  addMarker() {
    markersList.add(Marker(
        // icon: BitmapDescriptor.defaultMarkerWithHue((randomColor.toDouble())),
        markerId: MarkerId("id ${id}"),
        position: location,
        infoWindow: InfoWindow(title: location.toString())));
    notifyListeners();
  }
}
