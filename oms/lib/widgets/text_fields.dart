import 'package:flutter/material.dart';

import '../constants.dart';

Widget textfield(var title, controller, icon, context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      obscureText: title.toString().toLowerCase() == 'password' ? true : false,
      validator: (val) {},
      controller: controller,
      cursorColor: Constant.blackColor,
      style: TextStyle(
        color: Constant.blackColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constant.blackColor,
          size: 20,
        ),
        labelStyle: TextStyle(color: Constant.blackColor),
        contentPadding: const EdgeInsets.all(5),
        labelText: title,
        fillColor: const Color(0xff548fbb),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.blackColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.blackColor,
            width: 1.0,
          ),
        ),
      ),
    ),
  );
}
