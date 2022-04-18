import 'package:flutter/material.dart';

Widget loginTextField(controller,title){
  return TextFormField(
    cursorColor: Colors.white,
    controller: controller,
    style: const TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      contentPadding:const EdgeInsets.symmetric(vertical: 3),
      labelText: title,
      labelStyle:const TextStyle(color: Colors.white),
      enabledBorder:const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder:const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
}

Widget registerTextField(controller,title){
  return TextFormField(
    cursorColor: Colors.black,
    controller: controller,
    style: const TextStyle(
      color: Colors.black,
    ),
    decoration: InputDecoration(
      contentPadding:const EdgeInsets.symmetric(vertical: 3),
      labelText: title,
      labelStyle:const TextStyle(color: Colors.black),
      enabledBorder:const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder:const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}