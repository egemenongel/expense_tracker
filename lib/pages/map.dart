import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/marker_manager.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);

  @override
  Widget build(BuildContext context) {
    var _markerManager = Provider.of<MarkerManager>(context, listen: true);

    return Scaffold(
        body: GoogleMap(
      markers: Set.from(_markerManager.markersList),
      initialCameraPosition: _initialCameraPosition,
    ));
  }
}
