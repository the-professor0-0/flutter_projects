import 'package:ali_rams/widgets/constants.dart';
import 'package:flutter/material.dart';

Widget loginTextfield(var title, controller,icon, context,obs) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),

    child: TextFormField(
      obscureText: obs,
      validator: (val) {},
      controller: controller,
      cursorColor: Constant.blueColor,
      style: TextStyle(
        color: Constant.blueColor,
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Constant.blueColor,
        ),
        labelStyle: TextStyle(color: Constant.blueColor),
        contentPadding: const EdgeInsets.all(5),
        labelText: title,
        fillColor: const Color(0xff548fbb),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.orangeColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constant.orangeColor,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}
