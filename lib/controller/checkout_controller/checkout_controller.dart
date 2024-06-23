import 'package:flutter/material.dart';
import 'package:rent_cruise/model/checkout_card_model/checkout_card_model.dart';

class CheckoutController with ChangeNotifier {
  List<CheckoutCartModel> checkoutList = [];

  //add product to the list
  addProduct(CheckoutCartModel checkoutModel) {
    checkoutList.add(checkoutModel);
    notifyListeners();
  }

//delete product from the list
  deleteProduct(int index) {
    checkoutList.removeAt(index);
    notifyListeners();
  }

//clear all products from checkoutlist
  clearAllProducts() {
    checkoutList.clear();
    notifyListeners();
  }

  double totalAmmount = 0;
  checkAmmount(double ammount) {
    totalAmmount = ammount;
    notifyListeners();
  }
}
