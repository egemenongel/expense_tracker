import 'package:biobuluyo_app/pages/expense_by_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _expenseListManager =
        Provider.of<ExpenseListManager>(context, listen: false);
    var categoryList = _expenseListManager.categoryList;

    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Categories",
            style: Theme.of(context).textTheme.headline4,
          )),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.transparent,
                  height: 10,
                ),
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all()),
                        child: Theme(
                          child: ListTile(
                            title: Center(
                                child: Text(
                              categoryList[index],
                              style: const TextStyle(color: Colors.white),
                            )),
                            onTap: () {
                              _expenseListManager
                                  .expenseByCategory(categoryList[index]);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExpenseByCategoryPage()));
                            },
                          ),
                          data: ThemeData(highlightColor: Colors.blueAccent),
                        )),
                  );
                },
              ),
            )
          ],
        ));
  }
}
