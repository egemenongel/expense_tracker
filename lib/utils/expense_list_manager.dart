import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:biobuluyo_app/models/expense.dart';

class ExpenseListManager extends ChangeNotifier {
  List<ExpenseModel> expenseList = [];
  List categoryList = [];
  List expenseByCategoryList = [];
  int totalExpense = 0;
  var listIndex = 0;
  int markerId = 0;
  int total = 0;

  void addCategory() {
    categoryList.clear();
    for (ExpenseModel expenseModel in expenseList) {
      var category = expenseModel.category;
      if (!categoryList.contains(category)) {
        categoryList.add(category);
      }
    }
    notifyListeners();
  }

  List expenseByCategory(String category) {
    expenseByCategoryList.clear();
    for (ExpenseModel expenseModel in expenseList) {
      if (expenseModel.category == category) {
        expenseByCategoryList.add(expenseModel);
      }
    }
    return expenseByCategoryList;
  }

  void addExpense(ExpenseModel expenseModel) {
    expenseList.add(expenseModel);
    notifyListeners();
  }

  void removeExpense(index) {
    expenseList.removeAt(index);
    notifyListeners();
  }

  void editExpense({
    required int index,
    required int cost,
    required String description,
    required String category,
    required DateTime date,
  }) {
    var item = expenseList[index];
    item.cost = cost;
    item.description = description;
    item.category = category;
    item.date = date;
    notifyListeners();
  }
}
