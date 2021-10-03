import 'package:biobuluyo_app/models/expense.dart';
import 'package:flutter/cupertino.dart';

class ExpenseListModel extends ChangeNotifier {
  List<ExpenseModel> expenseList = [];
  int totalExpense = 0;
  var listIndex = 0;

  String loc = "";
  int markerId = 0;
  addExpense(ExpenseModel expenseModel) {
    expenseList.add(expenseModel);
    totalExpense += expenseModel.cost!;
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

  setMarkerId(int markerId) {
    this.markerId = markerId;
  }
}
