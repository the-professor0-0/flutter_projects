import 'package:ali_rams/authScreens/complete_profile.dart';
import 'package:ali_rams/screens/confirmation.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:ali_rams/screens/my_qr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home.dart';

Widget loginbutton(title, context) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case 'LOGIN':Get.offAll(const Home());break;
        case 'REGISTER':Get.to(const ProfileComplete());break;
      }
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 300,
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
      if(title=="Send Money"){
        Get.offAll(const Confirmation());
      }
      else{
        Get.offAll(const Home());
      }

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

Widget qrButton(title, context) {
  return GestureDetector(
    onTap: () {
      Get.to(const MyQr());
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

Widget sendButton(title, context) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case 'LOGIN':Get.offAll(const Home());break;
        case 'REGISTER':Get.to(const ProfileComplete());break;
      }
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 260,
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

Widget printButton(title, context) {
  return GestureDetector(
    onTap: () {
      Get.offAll(const Home());
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
            Constant.blueColor,
            Constant.blue2Color,
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
