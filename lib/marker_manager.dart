import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerManager extends ChangeNotifier {
  List<Marker> markersList = [];
  var myList = [];
  bool canPush = false;
  int id = 0;

  addMarker(Marker marker) {
    canPush = true;
    markersList.add(marker);
    notifyListeners();
  }
}
