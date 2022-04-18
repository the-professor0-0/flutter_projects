import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dollar/loginScreens/about_us.dart';
import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/loginScreens/our_services.dart';
import 'package:dollar/screens/collection/letter.dart';
import 'package:dollar/screens/collection/sentences.dart';
import 'package:dollar/screens/collection/words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomNav(context, indexNo) {
  return CurvedNavigationBar(
    backgroundColor: Colors.blue,
    items: const <Widget>[
      Icon(
        Icons.info_outline,
        size: 15,
      ),
      Icon(
        Icons.medical_services_outlined,
        size: 15,
      ),
      Icon(
        Icons.login_outlined,
        size: 15,
      ),
    ],
    index: indexNo,
    height: 50,
    animationDuration: const Duration(milliseconds: 200),
    animationCurve: Curves.bounceInOut,
    onTap: (index) {
      if (index == 0) {
        Get.offAll(const AboutUs());
      }
      if (index == 1) {
        Get.offAll(const OurServices());
      }
      if (index == 2) {
        Get.offAll(const Login());
      }
    },
  );
}

Widget bottomNav2(context, indexNo) {
  return CurvedNavigationBar(
    backgroundColor: Colors.blue,
    items: const <Widget>[
      Text("L"),
      Text("W"),
      Text("S"),
    ],
    index: indexNo,
    height: 50,
    animationDuration: const Duration(milliseconds: 200),
    animationCurve: Curves.bounceInOut,
    onTap: (index) {
      if (index == 0) {
        Get.to(const Letter());
      }
      if (index == 1) {
        Get.to(const Words());
      }
      if (index == 2) {
        Get.to(const Sentences());
      }
    },
  );
}
