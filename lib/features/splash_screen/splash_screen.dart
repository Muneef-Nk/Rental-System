import 'package:flutter/material.dart';
import 'package:rent_cruise/features/welcome_screen/welcome_screen.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
          (route) => false);
    });
    super.initState();
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
