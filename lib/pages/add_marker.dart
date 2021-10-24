import 'package:biobuluyo_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:biobuluyo_app/models/expense_list.dart';

class MarkerPage extends StatefulWidget {
  MarkerPage({Key? key, required this.expense}) : super(key: key);
  ExpenseModel expense;
  @override
  State<MarkerPage> createState() => MarkerState();
}

class MarkerState extends State<MarkerPage> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);
  GoogleMapController? _googleMapController;
  final List<Marker> _currentMarkerList = [];
  Marker? _marker;
  // final _randomColor = Random().nextInt(360);
  var latLng;
  @override
  Widget build(BuildContext context) {
    var _expenseListStore =
        Provider.of<ExpenseListModel>(context, listen: false);

    _handleTap(LatLng latLng) {
      setState(() {
        _marker = Marker(
          // icon:
          //     BitmapDescriptor.defaultMarkerWithHue((_randomColor.toDouble())),
          markerId: const MarkerId(""),
          position: latLng,
        );
        this.latLng = latLng;
        _currentMarkerList.add(_marker!);
      });
    }

    return Scaffold(
      body: GoogleMap(
          onMapCreated: (controller) => _googleMapController = controller,
          markers: Set.from(_currentMarkerList),
          onTap: _handleTap,
          initialCameraPosition: _initialCameraPosition),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              _expenseListStore.addExpense(widget.expense);
              widget.expense.latLng =
                  latLng; //LatLng of last expense is assigned in here.
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Submit"),
          ),
        ),
      ),
    );
  }
}
