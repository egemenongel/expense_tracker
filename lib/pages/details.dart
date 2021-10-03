import 'package:flutter/material.dart';
import 'package:biobuluyo_app/models/expense_list.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: false);
    var _list = _expenseListModel.expenseList;
    var _listIndex = _list[_expenseListModel.markerId];
    return Scaffold(
        body: Center(
            child: Container(
      height: 150,
      width: 250,
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 30, spreadRadius: 1)]),
          child: InkWell(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.cyan,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_listIndex.cost!} TL",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${_listIndex.description!}",
                          style: Theme.of(context).textTheme.headline5),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _listIndex.date!.toString().substring(0, 10),
                        style: TextStyle(color: Colors.orange[200]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            "${_listIndex.category}",
                            style: TextStyle(color: Colors.white),
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
