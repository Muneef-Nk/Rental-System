import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchScreenController with ChangeNotifier {
  var box = Hive.box('searchBox');
  List searchList = [];

  addSearchData(String searchData) async {
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

    getData();
    notifyListeners();
  }
}
