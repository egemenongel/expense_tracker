import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

import 'package:biobuluyo_app/main.dart';
import 'package:biobuluyo_app/pages/details.dart';

import 'package:biobuluyo_app/marker_manager.dart';
import 'package:biobuluyo_app/models/expense_list.dart';

class MarkerPage extends StatefulWidget {
  const MarkerPage({Key? key}) : super(key: key);

  @override
  State<MarkerPage> createState() => MarkerState();
}

class MarkerState extends State<MarkerPage> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);
  GoogleMapController? _googleMapController;
  final List<Marker> _currentMarker = [];
  LatLng? _latLng;
  Marker? _marker;
  var _markerId = 0;
  final _randomColor = Random().nextInt(360);

  @override
  Widget build(BuildContext context) {
    var _expenseListStore =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);
    var _expenseList = _expenseListStore.expenseList;
    _handleTap(LatLng latLng) {
      setState(() {
        _markerManager.canPush = false;
        _markerId = _expenseList.length - 1;
        _marker = Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue((_randomColor.toDouble())),
          markerId: MarkerId("markerId $_markerId"),
          position: latLng,
          infoWindow: InfoWindow(title: "${_expenseList[_markerId].cost} TL"),
          onTap: () {
            if (_markerManager.canPush == true) {
              _expenseListStore.setMarkerId(_markerId);
              Navigator.push(navigatorKey.currentState!.context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()));
            }
          },
        );

        _currentMarker.add(_marker!);
        _latLng = latLng;
      });
    }

    return Scaffold(
      body: GoogleMap(
          onMapCreated: (controller) => _googleMapController = controller,
          markers: Set.from(_currentMarker),
          onTap: _handleTap,
          initialCameraPosition: _initialCameraPosition),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              _markerManager.currentMarker = _marker;
              _markerManager.handleTap(_latLng!);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Submit"),
          ),
        ),
      ),
    );
  }
}
