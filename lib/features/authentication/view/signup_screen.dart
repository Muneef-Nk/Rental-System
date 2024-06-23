import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/authentication/controller/signup_controller.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';
import 'package:rent_cruise/features/authentication/widgets/login_bottom.dart';
import 'package:rent_cruise/features/authentication/widgets/social_container.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                ),
                Column(
                  children: [
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Fill your information below or register\n              with your social account",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7, bottom: 6),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
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
                  height: 20,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        fillColor: MaterialStateProperty.all(
                            ColorConstant.primaryColor),
                        value: true,
                        onChanged: (v) {}),
                    Text("Agree with "),
                    Text(
                      "Terms & Condition?",
                      style: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SignBotton(
                    lebal: "Sign Up",
                    onPressed: () {
                      Provider.of<SignupController>(context, listen: false)
                          .createUserWithEmailAndPassword(
                              emailAddress: _emailController.text,
                              context: context,
                              password: _passwordController.text);
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Text('Or sign Up in with '),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialContainer(
                      image: "assets/icons/apple.png",
                    ),
                    SocialContainer(
                      image: "assets/icons/fb.png",
                    ),
                    SocialContainer(
                      image: "assets/icons/goo.png",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: ColorConstant.primaryColor,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
