import 'package:flutter/material.dart';
import 'package:navigator/sign%20up%20widget/sign_up_data.dart';
import 'package:navigator/sign%20up%20widget/sign_up_otp.dart';

class MySignUp extends StatelessWidget {
  const MySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              MyData(name: "First Name"),
              SizedBox(height: 10),
              MyData(name: "Middle Name"),
              SizedBox(height: 10),
              MyData(name: "Last Name"),
              SizedBox(height: 10),
              MyData(name: "Enter the User Name"),
              SizedBox(height: 10),
              MyData(name: "Email"),
              SizedBox(height: 10),
              MyData(name: "Mobile Number"),
              SizedBox(height: 10),
              MyData(name: "Enter Your Password"),
              SizedBox(height: 10),
              MyData(name: "Confirm Your Password"),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: 500,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MySignupOtp()),
                      );
                    },
                    child: Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
