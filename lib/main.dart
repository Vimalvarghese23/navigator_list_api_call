import 'package:flutter/material.dart';
import 'package:navigator/bloc/login_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Provider(
        create: (context) => LoginBloc(),
        child: MyHome(),
      ),
    );
  }
}
