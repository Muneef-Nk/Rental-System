import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/authentication/controller/login_controller.dart';
import 'package:rent_cruise/features/authentication/view/signup_screen.dart';
import 'package:rent_cruise/features/authentication/widgets/login_bottom.dart';
import 'package:rent_cruise/features/authentication/widgets/social_container.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:rent_cruise/view/forgot_password_screen/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      "Sign In",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Hi! welcome back you have been missed",
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: ColorConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SignBotton(
                    lebal: "Sign In",
                    onPressed: () {
                      Provider.of<LoginScreenController>(context, listen: false)
                          .signInWithEmailAndPassword(
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
                    Text('Or sign in with '),
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
                    Text("Dont't have an accont?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          "Sign Up",
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
