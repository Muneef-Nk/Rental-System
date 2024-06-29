import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsController with ChangeNotifier {
  int selectedNumber = 1;
  String selectedTimeUnit = 'days';

  int totalDays = 1;

  List<String> timeUnits = ['days', 'weeks', 'months'];
  double totalPrice = 0.0;
  double price = 0.0;

  double lat = 0;
  double long = 0;

  totalPriceCalc(double price) {
    totalPrice = totalDays * price;
    notifyListeners();
  }

  timeUnitChange(String value) {
    selectedTimeUnit = value;
    notifyListeners();
  }

  resetValues() {
    totalPrice = 0.0;
    totalDays = 1;
    selectedNumber = 1;
    selectedTimeUnit = 'days';
    notifyListeners();
  }

  int calculateTotalDays() {
    switch (selectedTimeUnit) {
      case 'days':
        return selectedNumber * 1;
      case 'weeks':
        return selectedNumber * 7; // Assuming 1 week = 7 days
      case 'months':
        return selectedNumber * 30; // Assuming 1 month = 30 days
      default:
        return 0;
    }
  }

  void launchWhatsapp({required number, required name}) async {
    String message =
        'Hi, I am $name. I need urgent roadside assistance. Please help me.';
    String url = "whatsapp://send?phone=$number&text=$message";
    if (!await launchUrl(Uri.parse(url))) {
      throw ('Can\'t open whatsapp');
    }
  }
}
