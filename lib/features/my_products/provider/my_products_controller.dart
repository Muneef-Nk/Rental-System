import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_cruise/features/my_products/model/my_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProductsController with ChangeNotifier {
  List<MyProductModel> productlist = [];

  bool isLoading = false;

  getProducts() async {
    isLoading = true;
    notifyListeners();

    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');

    if (uid != null) {
      productsCollection
          .where('userId', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        productlist.clear();
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((doc) {
            productlist.add(
              MyProductModel(
                  documentId: doc.id,
                  name: doc['name'],
                  mainImage: doc['mainImage'],
                  description: doc['description'],
                  price: doc['price'],
                  subImage1: doc['athorImage1'],
                  subImage2: doc['athorImage2'],
                  subImage3: doc['athorImage3'],
                  subImage4: doc['athorImage4']),
            );
          });
        }
        notifyListeners();
      });
    } else {
      productlist = [];
    }

    isLoading = false;
    notifyListeners();
  }

  deleteProduct(BuildContext context, int index) {
    CollectionReference productRef =
        FirebaseFirestore.instance.collection('products');

    productlist.removeAt(index);

    productRef.doc(productlist[index].documentId).delete().then(
      (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("product deleted")));
      },
    );

    notifyListeners();
  }

  editProduct(
      {required String documnetid,
      required String name,
      required String des,
      required String price,
      required String mainImage,
      required String athorImage1,
      required String athorImage2,
      required String athorImage3,
      required String category,
      required String athorImage4,
      required BuildContext context}) async {
    CollectionReference productRef =
        FirebaseFirestore.instance.collection('products');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = await prefs.getString('uid');

    productRef.doc(documnetid).set({
      'name': name,
      'description': des,
      'price': price,
      'mainImage': mainImage,
      'athorImage1': athorImage1,
      'athorImage2': athorImage2,
      'athorImage3': athorImage3,
      'athorImage4': athorImage4,
      'lat': 0,
      'long': 0,
      'category': category,
      'userId': uid,
    }).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("product edited")));
    });

    notifyListeners();
  }
}
