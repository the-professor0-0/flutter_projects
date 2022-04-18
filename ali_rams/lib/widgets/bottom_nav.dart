import 'package:ali_rams/screens/home.dart';
import 'package:ali_rams/screens/qr_code.dart';
import 'package:ali_rams/screens/search_seller.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget navigationBar(context, indexNo) {
  return CurvedNavigationBar(
    backgroundColor: Constant.blueColor,
    items: <Widget>[
      Icon(
        Icons.home,
        size: 15,
        color: Constant.orangeColor,
      ),
      Icon(
        Icons.qr_code_scanner,
        size: 35,
        color: Constant.orangeColor,
      ),
      Icon(
          Icons.location_city,
          size: 15,
          color: Constant.orangeColor
      ),
    ],
    index: indexNo,
    height: 50,
    animationDuration: const Duration(milliseconds: 200),
    animationCurve: Curves.bounceInOut,
    onTap: (index) {
      if (index == 0) {
        Get.offAll(const Home());
      }
      if (index == 1) {
        Get.offAll(const QrCode());
      }
      if (index == 2) {
        Get.offAll(const Seller());
      }
    },
  );
}
