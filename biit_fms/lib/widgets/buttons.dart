import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:flutter/material.dart';
import 'package:biit_fms/constants/constants.dart';

Widget loginButton(title,empno,pass, context) {
  return GestureDetector(
    onTap: () {
      login(empno, pass, context);
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Constant.orangeColor,
              Constant.orange2Color,
            ],
          ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

Widget submitButton(title, context) {
  return GestureDetector(
    onTap: () {
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width-101,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Constant.orangeColor,
            Constant.orange2Color,
          ],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
