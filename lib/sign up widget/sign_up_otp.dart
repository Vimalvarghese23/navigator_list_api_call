import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class MySignupOtp extends StatelessWidget {
  const MySignupOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Your OTP",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          OtpTextField(
            numberOfFields: 4,
            borderColor: Colors.red,
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
          SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
