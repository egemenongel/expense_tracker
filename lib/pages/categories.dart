import 'package:biobuluyo_app/pages/expense_by_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _expenseListManager =
        Provider.of<ExpenseListManager>(context, listen: true);
    var categoryList = _expenseListManager.categoryList;
    var expenseList = _expenseListManager.expenseList;

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
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(categoryList[index]),
                  onTap: () {
                    _expenseListManager.expenseByCategory(categoryList[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ExpenseByCategoryPage()));
                  });
            },
          )),
        ],
      ),
    );
  }
}
