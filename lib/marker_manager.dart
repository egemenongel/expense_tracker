import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  int markerId = 0;

  addMarker(Marker marker) {
    markersList.add(marker);
    notifyListeners();
  }
}
