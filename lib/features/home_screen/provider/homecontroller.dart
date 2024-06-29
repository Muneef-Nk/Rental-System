import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  List searchSlider = [
    "Furniture Sets",
    "Cameras",
    "Tables and Chairs",
    "Tents",
    "Outdoor Gear ",
  ];

  // Method to get products from a specific category
  void getProductFromCategory(String category) {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    // Query products where 'category' field matches the specified category
    productsCollection
        .where('category', isEqualTo: category)
        .get()
        .then((QuerySnapshot querySnapshot) {
      // Handle the query snapshot here
      if (querySnapshot.docs.isNotEmpty) {
        // Loop through the documents snapshot
        querySnapshot.docs.forEach((doc) {
          // Access doc data as needed
          var productId = doc.id;
          var productName = doc['name'];
          var productPrice = doc['price'];
          // You can add more fields as per your document structure

          // Print or process each product data
          print('Product ID: $productId');
          print('Product Name: $productName');
          print('Product Price: $productPrice');
        });
      } else {
        print('No products found for category: $category');
      }

      // Notify listeners if using with ChangeNotifier
      notifyListeners();
    }).catchError((error) {
      print('Error getting products: $error');
    });
  }
}
