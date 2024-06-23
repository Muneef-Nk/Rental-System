import 'package:flutter/material.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: EdgeInsets.all(5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300)),
            child: Icon(
              Icons.arrow_back,
              color: ColorConstant.primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "New Password",
              style: TextStyle(color: ColorConstant.primaryColor, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "your new password must be different \n       from prevously used passwords",
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7, bottom: 6),
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
                suffixIcon: Icon(Icons.remove_red_eye),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7, bottom: 6),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Icon(Icons.remove_red_eye),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: ColorConstant.primaryColor,
              ),
              child: Center(
                child: Text(
                  "Create New Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
