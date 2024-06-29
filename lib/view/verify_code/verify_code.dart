import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class VerifyCode extends StatefulWidget {
  VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
      body: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Verify Code',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please enter the we just send to email',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Muneef@gmail.com',
            style: TextStyle(
                fontSize: 15,
                color: ColorConstant.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            validator: (s) => s == '7777' ? null : 'OTP is incorrect',
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) {
              print(pin);
              if (pin == '7777') {
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => CreateProfile()));
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Didn't receive OTP?",
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Resend code",
            style: TextStyle(
                fontSize: 15,
                color: ColorConstant.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // isCorrectOtp
              //     ? Navigator.of(context).pushReplacement(
              //         MaterialPageRoute(builder: (context) => EditProfile()))
              //     : ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text("Invalid OTP Please try again")));
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: ColorConstant.primaryColor,
              ),
              child: Center(
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
