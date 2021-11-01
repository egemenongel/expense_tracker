import 'package:biobuluyo_app/widgets/report_card.dart';
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
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ReportCard(
                icon: Icons.format_list_numbered,
                title: "You have totally",
                subtitle: "${_expenseListManager.totalExpense} Expense(s)"),
            const SizedBox(
              height: 20,
            ),
            ReportCard(
                icon: Icons.account_balance_wallet_rounded,
                title: "Total Expenses",
                subtitle: "${_expenseListManager.total} TL"),
            const SizedBox(
              height: 20,
            ),
            ReportCard(
              icon: Icons.apps_rounded,
              title: "Average Expense",
              subtitle: "${_expenseListManager.average} TL",
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
