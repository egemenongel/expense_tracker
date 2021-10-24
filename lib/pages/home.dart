import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:biobuluyo_app/pages/edit.dart';
import 'package:biobuluyo_app/pages/map.dart';
import 'package:biobuluyo_app/pages/form.dart';
import 'package:biobuluyo_app/pages/categories.dart';
import 'package:biobuluyo_app/pages/details.dart';

import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:biobuluyo_app/models/marker_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: true);
    var _expenseList = _expenseListModel.expenseList;
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);

    void addMarkers() {
      _markerManager.markersList.clear();
      for (ExpenseModel expenseModel in _expenseList) {
        if (expenseModel.latLng != null) {
          var id = _markerManager.markersList.length;
          var marker = Marker(
              markerId: MarkerId("$id"),
              position: expenseModel.latLng!,
              onTap: () {
                _markerManager.markerId = _expenseList.indexOf(expenseModel);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailsPage()));
              });
          _markerManager.addMarker(marker);
        }
      }
    }

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text("My Expenses", style: Theme.of(context).textTheme.headline5),
          Expanded(
            child: ListView.separated(
              itemCount: _expenseListModel.expenseList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.transparent,
                height: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                var list = _expenseListModel.expenseList;
                return Slidable(
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Row(
                      children: [
                        Text("${list[index].description} "),
                        const Expanded(child: SizedBox()),
                        Text("${list[index].cost} TL"),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(list[index].date.toString().substring(0, 10)),
                        const Expanded(child: SizedBox()),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "${list[index].category}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  actionPane: const SlidableScrollActionPane(),
                  actionExtentRatio: 0.20,
                  actions: [
                    IconSlideAction(
                      caption: "Edit",
                      icon: Icons.edit,
                      color: Colors.blue,
                      onTap: () {
                        _expenseListModel.setIndex(index);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditPage()));
                      },
                    ),
                  ],
                  secondaryActions: [
                    IconSlideAction(
                      caption: "Remove",
                      icon: Icons.remove,
                      color: Colors.red,
                      onTap: () => _expenseListModel.removeExpense(index),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    addMarkers();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapPage()));
                  },
                  child: const Text("Show Map")),
              const SizedBox(
                height: 30,
                child: VerticalDivider(
                  width: 0,
                  color: Colors.grey,
                ),
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryPage())),
                  child: const Text("Categories")),
            ],
          ),
          // Text(
          //   "Total: ${_expenseListModel.totalExpense} TL",
          // ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
