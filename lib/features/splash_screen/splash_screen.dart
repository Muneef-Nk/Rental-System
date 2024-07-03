import 'package:flutter/material.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';
import 'package:rent_cruise/features/bottom_navigation/bottom_navigation.dart';
import 'package:rent_cruise/features/welcome_screen/welcome_screen.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      checkWhichScreen();
    });
    super.initState();
  }

  checkWhichScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isScreen = await prefs.getBool('isLogin');

    if (isScreen != null) {
      if (isScreen) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => RootScreen()),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          "Urban Lease",
          style: TextStyle(
              color: ColorConstant.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
