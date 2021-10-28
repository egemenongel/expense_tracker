import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:biobuluyo_app/models/expense.dart';

class ExpenseListModel extends ChangeNotifier {
  List<ExpenseModel> expenseList = [];
  List categoryList = [];
  List expenseByCategoryList = [];
  int totalExpense = 0;
  var listIndex = 0;
  int markerId = 0;
  int total = 0;

  addCategory() {
    categoryList.clear();
    for (ExpenseModel expenseModel in expenseList) {
      var category = expenseModel.category;
      if (!categoryList.contains(category)) {
        categoryList.add(category);
      }
    }
    notifyListeners();
  }

  expenseByCategory(String category) {
    expenseByCategoryList.clear();
    for (ExpenseModel expenseModel in expenseList) {
      if (expenseModel.category == category) {
        expenseByCategoryList.add(expenseModel);
      }
    }
    return expenseByCategoryList;
  }

  addExpense(ExpenseModel expenseModel) {
    expenseList.add(expenseModel);
    // totalExpense += expenseModel.cost!;
    notifyListeners();
  }

  removeExpense(index) {
    expenseList.removeAt(index);
    notifyListeners();
  }

  setIndex(index) {
    listIndex = index;
  }

  editExpense(index, ExpenseModel expenseModel) {
    expenseList[index] = expenseModel;
    notifyListeners();
  }

  void editForm({
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

  // edit(int index) {
  //   expenseList[index].cost = 3;
  //   notifyListeners();
  // }

  clearList() {
    expenseList.clear();
    notifyListeners();
  }
}
