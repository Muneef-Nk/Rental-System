import 'package:flutter/material.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorConstant.primaryColor,
        ),
        Align(
            alignment: Alignment(0, 0),
            child: Image.asset("assets/images/bg.png")),
        Align(
            alignment: Alignment(-0.6, -0.6),
            child: Text(
              "Everything On \nRent...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )),
        Align(
          alignment: Alignment(0, 1),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Get Starts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
