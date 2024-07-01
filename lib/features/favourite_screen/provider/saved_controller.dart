import 'package:flutter/material.dart';

class SavedController with ChangeNotifier {
  List savedLIst = [];

  addtoSave(int index) {
    bool exist = savedLIst.isNotEmpty &&
        savedLIst.any((element) => element.index == index);
    if (exist) {
      //
    } else {
      savedLIst.add(index);
      notifyListeners();
    }

    notifyListeners();
  }
}
