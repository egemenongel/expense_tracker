import 'dart:async';
import 'dart:math';
import 'package:biobuluyo_app/main.dart';
import 'package:biobuluyo_app/marker_manager.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:biobuluyo_app/pages/details.dart';
import 'package:biobuluyo_app/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerPage extends StatefulWidget {
  const MarkerPage({Key? key}) : super(key: key);

  @override
  State<MarkerPage> createState() => MarkerState();
}

class MarkerState extends State<MarkerPage> {
  final List<Marker> _currentMarker = [];
  var _LatLng;
  var _markerId = 0;
  var _randomColor = Random().nextInt(360);
  var _marker;

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
          onTap: () {
            if (_markerManager.canPush == true) {
              _expenseListStore.setMarkerId(_markerId);
              Navigator.push(navigatorKey.currentState!.context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()));
            }
          },
        );
        _currentMarker.add(_marker);
        _LatLng = latLng;
      });
    }

    return Scaffold(
      body: GoogleMap(
        markers: Set.from(_currentMarker),
        onTap: _handleTap,
        initialCameraPosition: const CameraPosition(
            target: LatLng(40.9975443, 28.9243776), zoom: 8),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              _markerManager.currentMarker = _marker;
              _markerManager.handleTap(_LatLng);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Submit"),
          ),
        ),
      ),
    );
  }
}
