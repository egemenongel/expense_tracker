import 'package:biobuluyo_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/pages/map.dart';
import 'package:biobuluyo_app/pages/add_expense.dart';
import 'package:biobuluyo_app/pages/categories.dart';

import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:biobuluyo_app/models/marker_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _expenseList = _expenseListModel.expenseList;
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text("My Expenses", style: Theme.of(context).textTheme.headline5),
          const Expanded(
            child: ExpensesList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _markerManager.addMarkers(_expenseList);
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
                  onPressed: () {
                    _expenseListModel.addCategory();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryPage()));
                  },
                  child: const Text("Categories")),
            ],
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
              MaterialPageRoute(builder: (context) => AddExpensePage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
