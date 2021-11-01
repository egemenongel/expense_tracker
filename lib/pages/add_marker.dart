import 'package:biobuluyo_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/utils/marker_manager.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class AddMarkerPage extends StatefulWidget {
  const AddMarkerPage({
    Key? key,
    required this.expense,
  }) : super(key: key);
  final ExpenseModel expense;
  @override
  State<AddMarkerPage> createState() => _AddMarkerPageState();
}

class _AddMarkerPageState extends State<AddMarkerPage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(39.9686631, 34.5125143), zoom: 5);
  GoogleMapController? _googleMapController;
  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _expenseListManager =
        Provider.of<ExpenseListManager>(context, listen: false);
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Marker",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Consumer<MarkerManager>(
        builder: (_, markerManager, __) => GoogleMap(
            onMapCreated: (controller) => _googleMapController = controller,
            markers: Set.from(markerManager.currentMarkerList),
            onTap: markerManager.addCurrentMarker,
            initialCameraPosition: _initialCameraPosition),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        )),
        extendedPadding: const EdgeInsets.all(150.0),
        onPressed: () {
          _expenseListManager.addExpense(widget.expense);
          _markerManager.setExpenseLocation(
              expense: widget.expense, location: _markerManager.latLng);
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        label: Text("Submit", style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
