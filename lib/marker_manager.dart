import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  LatLng? location;
  Marker? currentMarker;
  bool canPush = false;
  int markerId = 0;

  handleTap(LatLng latLng) {
    location = latLng;
    addMarker();
    notifyListeners();
  }

  addMarker() {
    canPush = true;
    markersList.add(currentMarker!);
    notifyListeners();
  }

  setMarkerId(int markerId) {
    this.markerId = markerId;
  }
}
