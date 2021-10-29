import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/utils/marker_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class AddMarkerPage extends StatelessWidget {
  const AddMarkerPage({
    Key? key,
    required this.expense,
  }) : super(key: key);
  final ExpenseModel expense;
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);

  @override
  Widget build(BuildContext context) {
    var _expenseListStore =
        Provider.of<ExpenseListManager>(context, listen: false);
    var _markerManager = Provider.of<MarkerManager>(context, listen: true);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GoogleMap(
          markers: Set.from(_markerManager.currentMarkerList),
          onTap: _markerManager.addCurrentMarker,
          initialCameraPosition: _initialCameraPosition),
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        )),
        extendedPadding: const EdgeInsets.all(150.0),
        onPressed: () {
          _expenseListStore.addExpense(expense);
          _markerManager.setExpenseLocation(
              expense: expense, location: _markerManager.latLng);
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        label: const Text("Submit"),
      ),
    );
  }
}
