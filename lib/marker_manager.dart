import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    notifyListeners();
  }
}
