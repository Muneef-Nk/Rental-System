import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rent_cruise/features/category/model/category_model.dart';

class CategoryController with ChangeNotifier {
  List<CategoryModel> selectedCategories = [];
  void getProductFromCategory(String category) {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    productsCollection
        .where('category', isEqualTo: category)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          selectedCategories.add(CategoryModel(
              documentId: doc.id,
              image: doc['mainImage'],
              name: doc['name'],
              price: doc['price']));
        });
      } else {
        print('No products found for category: $category');
        selectedCategories = [];
      }

      notifyListeners();
    }).catchError((error) {
      print('Error getting products: $error');
    });
  }
}
