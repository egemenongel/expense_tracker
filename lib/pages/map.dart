import 'package:biobuluyo_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:biobuluyo_app/utils/marker_manager.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Map",
      ),
      body: GoogleMap(
        markers: Set.from(context.read<MarkerManager>().markersList),
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
