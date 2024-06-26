import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class UploadProductControllr with ChangeNotifier {
  String dropdownvalue = 'Select Category';
  List<String> items = [];

  getCategoris() async {
    CollectionReference category =
        FirebaseFirestore.instance.collection('categories');

    QuerySnapshot querySnapshot = await category.get();
    List<String> categories =
        querySnapshot.docs.map((doc) => doc['name'].toString()).toList();

    items = ['Select Category', ...categories];

    notifyListeners();
  }

  void setDropdownValue(String value) {
    dropdownvalue = value;
    notifyListeners();
  }

  String? mainImageUrl;
  String? athorImage1;
  String? athorImage2;
  String? athorImage3;
  String? athorImage4;

  uploadMainImage(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child("productImages");

    final uploadRef =
        imagesRef.child(DateTime.now().microsecondsSinceEpoch.toString());

    await uploadRef.putFile(File(image.path));

    mainImageUrl = await uploadRef.getDownloadURL();
    notifyListeners();
  }

  uploadAthorImage1(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child("productImages");

    final uploadRef =
        imagesRef.child(DateTime.now().microsecondsSinceEpoch.toString());

    await uploadRef.putFile(File(image.path));

    athorImage1 = await uploadRef.getDownloadURL();
    notifyListeners();
  }

  // imge 2
  uploadAthorImage2(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child("productImages");

    final uploadRef =
        imagesRef.child(DateTime.now().microsecondsSinceEpoch.toString());

    await uploadRef.putFile(File(image.path));

    athorImage2 = await uploadRef.getDownloadURL();
    notifyListeners();
  }

  //image 3
  uploadAthorImage3(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child("productImages");

    final uploadRef =
        imagesRef.child(DateTime.now().microsecondsSinceEpoch.toString());

    await uploadRef.putFile(File(image.path));

    athorImage3 = await uploadRef.getDownloadURL();
    notifyListeners();
  }

  //image 4
  uploadAthorImage4(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child("productImages");

    final uploadRef =
        imagesRef.child(DateTime.now().microsecondsSinceEpoch.toString());

    await uploadRef.putFile(File(image.path));

    athorImage4 = await uploadRef.getDownloadURL();
    notifyListeners();
  }

  removeImages(int imageIndex) {
    if (imageIndex == 0) {
      mainImageUrl = null;
    } else if (imageIndex == 1) {
      athorImage1 = null;
    } else if (imageIndex == 2) {
      athorImage2 = null;
    } else if (imageIndex == 3) {
      athorImage3 = null;
    } else if (imageIndex == 4) {
      athorImage4 = null;
    }
    notifyListeners();
  }

  uploadProduct(
      {required String name, required String des, required String price}) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    products
        .add({
          'name': name,
          'description': des,
          'price': price,
          'mainImage': mainImageUrl,
          'athorImage1': athorImage1,
          'athorImage2': athorImage2,
          'athorImage3': athorImage3,
          'athorImage4': athorImage4
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    notifyListeners();
  }
}
