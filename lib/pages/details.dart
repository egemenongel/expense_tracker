import 'package:biobuluyo_app/marker_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/models/expense_list.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _list = _expenseListModel.expenseList;
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);
    var _listIndex = _list[_markerManager.markerId];
    return Scaffold(
        body: Center(
            child: SizedBox(
      height: 150,
      width: 250,
      child: Container(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 30, spreadRadius: 1)]),
          child: InkWell(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.cyan,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_listIndex.cost!} TL",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(_listIndex.description!,
                          style: Theme.of(context).textTheme.headline5),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _listIndex.date!.toString().substring(0, 10),
                        style: TextStyle(color: Colors.orange[200]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            "${_listIndex.category}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          )),
    )));
  }
}
