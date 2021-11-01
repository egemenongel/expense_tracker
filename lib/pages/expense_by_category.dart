import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:biobuluyo_app/utils/expense_list_manager.dart';

class ExpenseByCategoryPage extends StatelessWidget {
  const ExpenseByCategoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _expenseListManager =
        Provider.of<ExpenseListManager>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Center(
          child: Text(
              "${_expenseListManager.expenseByCategoryList.first.category}"),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 250.0,
            //   width: 250.0,
            //   child: Card(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(10)),
            //             color: Colors.grey[400],
            //           ),
            //           height: 70.0,
            //           width: 70.0,
            //           child: Icon(
            //             Icons.account_balance_wallet,
            //             size: 50,
            //           ),
            //         ),
            //         const Text("Total Expenses: ",
            //             style: TextStyle(
            //               fontSize: 25.0,
            //               color: Colors.cyan,
            //             )),
            //         const SizedBox(
            //           height: 20.0,
            //         ),
            //         Text(
            //           "${_expenseListManager.total} TL",
            //           style: Theme.of(context).textTheme.headline5,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey),
              height: 200.0,
              width: 250.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white70,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.format_list_numbered,
                      color: Colors.teal[100],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You have totally",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.tealAccent,
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "${_expenseListManager.totalExpense} Expense(s)",
                        style:
                            TextStyle(color: Colors.teal[100], fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey),
              height: 200.0,
              width: 250.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white70,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.teal[100],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Total Expenses",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.tealAccent,
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "${_expenseListManager.total} TL",
                        style:
                            TextStyle(color: Colors.teal[100], fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey),
              height: 200.0,
              width: 250.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white70,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.apps_sharp,
                      color: Colors.teal[100],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Average Expense",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.tealAccent,
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "${_expenseListManager.average} TL",
                        style:
                            TextStyle(color: Colors.teal[100], fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
