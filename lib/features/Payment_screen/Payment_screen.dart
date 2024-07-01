import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_cruise/features/bottom_navigation/bottom_navigation.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
              height: 200,
              width: 350,
              child: Lottie.asset("assets/animations/payment.json",
                  fit: BoxFit.fill)),
        ),
        Center(
            child: Text(
          "Payment Successfull",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorConstant.primaryColor),
        )),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => RootScreen()),
                (route) => false);

            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            child: Center(
              child: Text(
                "Back Home",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorConstant.primaryColor),
          ),
        )
      ]),
    );
  }
}
