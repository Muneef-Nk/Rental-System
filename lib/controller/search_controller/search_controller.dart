import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rent_cruise/model/search_screen.dart/search_item_model.dart';

class SearchScreenController with ChangeNotifier {
  var box = Hive.box<SearchItemModel>('searchBox');
  List<SearchItemModel> searchList = [];

  addSearchData(SearchItemModel searchData) async {
    await box.add(searchData);
    print("data added hive");
    getData();
    notifyListeners();
  }

  getData() async {
    searchList = await box.values.toList();
    notifyListeners();
  }

  deleteData(int index) {
    box.deleteAt(index);
    notifyListeners();
  }

  deleteAll() {
    box.deleteAll(searchList);
    notifyListeners();
  }
}
