import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/models/expense_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _expenseListModel =
        Provider.of<ExpenseListModel>(context, listen: true);
    var list = _expenseListModel.expenseList;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.transparent,
              height: 1,
            ),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Text("${list[index].category}");
            },
          )),
        ],
      ),
    );
  }
}
