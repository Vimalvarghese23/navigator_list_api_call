import 'package:flutter/material.dart';

class MyData extends StatelessWidget {
  final String name;
  const MyData({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
