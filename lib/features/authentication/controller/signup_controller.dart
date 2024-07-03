import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_cruise/features/profile/view/create_profile.dart';
import 'package:rent_cruise/utils/helper_function/helper_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController with ChangeNotifier {
  createUserWithEmailAndPassword(
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

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', userCredential.user!.uid);
      await prefs.setBool('isLogin', true);

      showSnackBar("Registration successful", context);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => CreateProfile(
                    address: '',
                    isEdit: false,
                    email: '',
                    name: '',
                    phoneNumber: '',
                    pic: '',
                  )),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar("The password provided is too weak.", context);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar("The account already exists for that email.", context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
    notifyListeners();
  }
}
