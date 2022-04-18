import 'package:flutter/material.dart';

Widget textField(var title, controller, context, obs) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      obscureText: obs,
      controller: controller,
      decoration: InputDecoration(
        labelStyle:const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.all(5),
        labelText: title,
        fillColor: const Color(0xff548fbb),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}
