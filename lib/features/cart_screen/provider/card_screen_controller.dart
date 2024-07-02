import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CardScreenController with ChangeNotifier {
  List cardlist = [];
  bool exist = false;
  double sum = 0;

  var box = Hive.box('cart');

  void addToCart(String documentId, BuildContext context) {
    if (isSaved(documentId)) {
      cardlist.remove(documentId);
      box.delete(documentId);
      print('Removed: $documentId');
    } else {
      cardlist.add(documentId);
      box.put(documentId, documentId);
      showTopSnackBar(
        animationDuration: Duration(seconds: 1),
        displayDuration: Duration(milliseconds: 2),
        Overlay.of(context),
        CustomSnackBar.success(
          message: "Product Successfully Added to Cart",
        ),
      );
    }
    notifyListeners();
  }

  bool isSaved(String documentId) {
    return cardlist.contains(documentId);
  }

//delete product from the cart list
  deleteProduct(String documentId, BuildContext context) {
    cardlist.remove(documentId);
    box.delete(documentId);
    showTopSnackBar(
      animationDuration: Duration(seconds: 1),
      displayDuration: Duration(milliseconds: 2),
      Overlay.of(context),
      CustomSnackBar.error(
        message: "Product removed from Cart",
      ),
    );
    notifyListeners();
  }

  // calculateAllProductPrice() {
  //   cardlist.forEach(
  //     (element) {
  //       sum += double.parse(element.totalPrice);
  //       notifyListeners();
  //     },
  //   );
  //   notifyListeners();
  // }

  calculateAfterDeletedProductPrice(double price) {
    sum = sum - price;

    notifyListeners();
  }
}
