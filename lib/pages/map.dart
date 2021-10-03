import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:biobuluyo_app/marker_manager.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _markerManager = Provider.of<MarkerManager>(context, listen: true);
    return Scaffold(
        body: GoogleMap(
      markers: Set.from(_markerManager.markersList),
      initialCameraPosition:
          const CameraPosition(target: LatLng(40.9975443, 28.9243776), zoom: 8),
    ));
  }
}
