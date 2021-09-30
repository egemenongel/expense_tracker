import 'package:biobuluyo_app/models/expense.dart';
import 'package:flutter/cupertino.dart';

class ExpenseListModel extends ChangeNotifier {
  List<ExpenseModel> expenseList = [];
  int totalExpense = 0;
  String loc = "";
  // ExpenseListModel({required this.expenseList}) {
  //   this.expenseList = expenseList;
  // }

  addExpense(ExpenseModel expenseModel) {
    expenseList.add(expenseModel);
    notifyListeners();
  }

  removeExpense(index) {
    expenseList.removeAt(index);
    notifyListeners();
  }

  clearList() {
    expenseList.clear();
    notifyListeners();
  }
}
