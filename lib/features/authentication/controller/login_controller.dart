import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_cruise/view/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/helper_function/helper_function.dart';

class LoginScreenController with ChangeNotifier {
  signInWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    try {
      if (emailAddress.isEmpty || password.isEmpty) {
        showSnackBar("please email, password", context);
      }

      if (!emailAddress.contains('@gmail.com')) {
        showSnackBar("please enter valid mail address", context);
      }
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print(userCredential.user!.uid);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', userCredential.user!.uid);

      showSnackBar("Successful Loggedin", context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Homescreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        showSnackBar("Wrong password provided for that user.'", context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }

    notifyListeners();
  }
}
