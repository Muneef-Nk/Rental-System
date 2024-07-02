import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedController with ChangeNotifier {
  List<String> savedList = [];

  var box = Hive.box('favourite');

  void addToSave(String documentId) {
    if (isSaved(documentId)) {
      savedList.remove(documentId);
      box.delete(documentId);
      print('Removed: $documentId');
    } else {
      savedList.add(documentId);
      box.put(documentId, documentId);
      print('Added: $documentId');
    }
    notifyListeners();
  }

  bool isSaved(String documentId) {
    return savedList.contains(documentId);
  }
}
