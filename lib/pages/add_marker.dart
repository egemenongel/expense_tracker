import 'dart:async';
import 'dart:math';
import 'package:biobuluyo_app/marker.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
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
  List<Marker> _marker = [];
  var location = LatLng(40.8957472, 29.168124);
  var id = 0;
  // void _onMapCreated(GoogleMapController controller) {
  //   setState(() {
  //     _markers.add(const Marker(
  //         markerId: MarkerId("id"), position: LatLng(40.8957472, 29.168124)));
  //   });
  // }
  var rnd = Random();
  late var randomColor = rnd.nextInt(360);

  _handleTap(LatLng latLng) {
    setState(() {
      _marker.add(Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue((randomColor.toDouble())),
          markerId: MarkerId("id $id"),
          position: latLng,
          infoWindow: InfoWindow(title: latLng.toString())));
      location = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _expenseListModel = Provider.of<ExpenseListModel>(context,
        listen: false); // Should not be rebuilded again.
    // var _expenseModel = Provider.of<ExpenseModel>(context, listen: true);
    var _markerManager = Provider.of<MarkerManager>(context, listen: true);
    return Scaffold(
      body: GoogleMap(
        markers: Set.from(_marker),
        onTap: _handleTap,
        initialCameraPosition: const CameraPosition(
            target: LatLng(40.9975443, 28.9243776), zoom: 8),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              // _expenseListModel.loc = location.toString();
              //SUBMITTEN SONRA EKLENMELİ
              _markerManager.handleTap(location);
              _markerManager.markersList.add(_marker[0]);
              // _markerManager.addMarker();
              debugPrint(
                  "LENGTH:" + _markerManager.markersList.length.toString());
              // print(location);
              Navigator.pop(context);
              // _expenseModel.setLocation(location);
            },
            child: const Text("Add this location"),
          ),
        ),
      ),
    );
  }
}
