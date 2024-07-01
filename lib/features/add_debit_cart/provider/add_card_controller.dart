import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:rent_cruise/features/add_debit_cart/model/cardModel.dart';

class AddCardController with ChangeNotifier {
  CollectionReference debitCard =
      FirebaseFirestore.instance.collection('debitCard');

  addCard(CardModel cardModel) {
    debitCard
        .add({
          "bank": cardModel.bankName,
          "cvv": cardModel.cvv,
          "expiry_date": cardModel.expiryDate,
          "name": cardModel.name,
          "card_number": cardModel.accountNumber,
        })
        .then((value) => print("card added"))
        .catchError((Error) => print("failed to add card"));
    notifyListeners();
  }

  bool isLoading = false;

  List banksName = [
    "Bank of Baroda",
    "Bank of India",
    "Canara Bank",
    "Indian Bank",
    "State Bank of India",
    "UCO Bank",
    "Union Bank of India",
    "south indian bank"
  ];

  String selectedBankName = '';
}
