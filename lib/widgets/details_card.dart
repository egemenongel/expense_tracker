import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:biobuluyo_app/models/marker_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _list = _expenseListModel.expenseList;
    var _markerManager = Provider.of<MarkerManager>(context, listen: false);
    var _expense = _list[_markerManager.markerId];
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFF0971B3), Color(0xFFFF0000)],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.payments,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${_expense.cost!} TL",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(_expense.description!,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xFFFFCE19))),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    _expense.date!.toString().substring(0, 10),
                    style: const TextStyle(color: Color(0xFF19FF5A)),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    "${_expense.category}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
