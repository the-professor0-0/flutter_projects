import 'package:flutter/material.dart';

Widget aboutText(String name,String value) {
  return Column(
    children: [
      Text(
        name.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 2.0,
        ),
      ),
      SizedBox(height: 10.0),
      Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          letterSpacing: 2.0,
        ),
      ),
      SizedBox(height: 30.0),
    ],
  );
}
