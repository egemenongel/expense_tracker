import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/marker_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:biobuluyo_app/models/expense_list.dart';

class AddMarkerPage extends StatefulWidget {
  const AddMarkerPage({Key? key, required this.expense}) : super(key: key);
  final ExpenseModel expense;
  @override
  State<AddMarkerPage> createState() => AddMarkerPageState();
}

class AddMarkerPageState extends State<AddMarkerPage> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);
  GoogleMapController? _googleMapController;

  @override
  Widget build(BuildContext context) {
    var _expenseListStore =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _markerManager = Provider.of<MarkerManager>(context, listen: true);

    return Scaffold(
      body: GoogleMap(
          onMapCreated: (controller) => _googleMapController = controller,
          markers: Set.from(_markerManager.currentMarkerList),
          onTap: _markerManager.addCurrentMarker,
          initialCameraPosition: _initialCameraPosition),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: ElevatedButton(
            onPressed: () {
              _expenseListStore.addExpense(widget.expense);
              _markerManager.setExpenseLocation(
                  expense: widget.expense, location: _markerManager.latLng);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Submit"),
          ),
        ),
      ),
    );
  }
}
