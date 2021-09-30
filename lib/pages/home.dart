import 'package:biobuluyo_app/models/expense.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:biobuluyo_app/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'form.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: true);

    //SNACKBAR CAN BE ADDED.
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text("Giderlerim", style: Theme.of(context).textTheme.headline5),
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
                        Text(
                            "${list[index].date.toString().substring(0, 10)}  ${list[index].location}"),
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
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: "Close",
                      icon: Icons.clear,
                      color: Colors.black,
                      onTap: () {},
                    )
                  ],
                  secondaryActions: [
                    IconSlideAction(
                      caption: "Remove",
                      icon: Icons.remove,
                      color: Colors.red,
                      onTap: () => _expenseListModel.removeExpense(index),
                    ),
                    IconSlideAction(
                      caption: "Close",
                      icon: Icons.clear,
                      color: Colors.black,
                      onTap: () {},
                    )
                  ],
                );
              },
            ),
          ),
          TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MapPage())),
              child: const Text("Show Map")),
          Text(
            "Total: ${_expenseListModel.totalExpense} TL",
          ),
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
