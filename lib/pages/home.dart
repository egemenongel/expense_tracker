import 'package:biobuluyo_app/marker_manager.dart';
import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/pages/categories.dart';
import 'package:biobuluyo_app/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:biobuluyo_app/pages/edit.dart';
import 'package:biobuluyo_app/pages/map.dart';
import './form.dart';

import 'package:biobuluyo_app/models/expense_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: true);
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);
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
                    onTap: () {},
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
                    _markerManager.myList.clear();
                    for (ExpenseModel expenseModel
                        in _expenseListModel.expenseList) {
                      if (expenseModel.latLng != null) {
                        var id = _markerManager.myList.length;
                        var marker = Marker(
                            markerId: MarkerId("${id}"),
                            position: expenseModel.latLng!,
                            onTap: () {
                              _markerManager.id = _expenseListModel.expenseList
                                  .indexOf(expenseModel);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailsPage()));
                            });
                        _markerManager.myList.add(marker);
                        debugPrint("$id");
                      }
                    }

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
