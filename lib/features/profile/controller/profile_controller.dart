import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_cruise/utils/helper_function/helper_function.dart';
import 'package:rent_cruise/view/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileControllr with ChangeNotifier {
  String? profileUrl;

  bool isUploading = false;

  uploadProfile(XFile image) async {
    isUploading = true;
    notifyListeners();
    final storageRef = FirebaseStorage.instance.ref();

    final imagesRef = storageRef.child("profiles");

    final uploadRef =
        imagesRef.child(DateTime.now().microsecondsSinceEpoch.toString());

    await uploadRef.putFile(File(image.path));

    profileUrl = await uploadRef.getDownloadURL();
    isUploading = false;
    notifyListeners();
  }

  addProfile(
      {required String name,
      required String email,
      required String phoneNumber,
      required BuildContext context,
      required String address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = await prefs.getString('uid');

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uid).set({
      'image': profileUrl,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'uid': uid,
    });

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Homescreen()),
      (route) => false,
    );
    showSnackBar('Profile added', context);

    notifyListeners();
  }

  updateProfile(
      {required String name,
      required String email,
      required String phoneNumber,
      required BuildContext context,
      required String address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = await prefs.getString('uid');

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.doc(uid).update({
      'image': profileUrl,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'uid': uid,
    });

    Navigator.of(context).pop();
    showSnackBar('Profile updated', context);

    notifyListeners();
  }
}
