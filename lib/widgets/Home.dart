import 'package:flutter/material.dart';

import 'package:navigator/widgets/list.dart';
import 'package:navigator/request%20class/login_request.dart';

import 'package:navigator/network/auth_repo.dart';
import 'package:navigator/sign%20up%20widget/sign_up.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login App")),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Enter User Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Enter the Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      AuthRepo repo = AuthRepo();
                      final Response = await repo.loginRequest(LoginRequest(
                          email: emailController.text,
                          password: passwordController.text));
                      if (Response != null && Response.error == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          Response!.error.toString(),
                        )));
                      }
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))),
            SizedBox(height: 10),
            Text("OR"),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MySignUp()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(height: 10),
            Text("Forget Password?"),
          ],
        ),
      ),
    ));
  }
}
