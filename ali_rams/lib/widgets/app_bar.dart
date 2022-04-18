import 'package:ali_rams/screens/user.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appbar() {
  return AppBar(
      iconTheme: IconThemeData(color: Constant.blueColor),
      backgroundColor: Colors.white,
      title: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child:const Image(
            image: AssetImage('assets/appbar.png'),
            width: 150,
          ),
        ),
      ),
      actions: [
        Container(
            margin:const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: (){
                Get.to(const User());
              },
              child: Icon(
                Icons.person,
                color: Constant.blueColor,
              ),
            )),
      ]);
}

AppBar appbar2() {
  return AppBar(
      iconTheme: IconThemeData(color: Constant.blueColor),
      backgroundColor: Colors.white,
      title: const Center(
        child: Image(
          image: AssetImage('assets/appbar.png'),
          width: 150,
        ),
      ),
      actions: [
        Container(
            margin:const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: (){
                Get.to(const User());
              },
              child: Icon(
                Icons.person,
                color: Constant.blueColor,
              ),
            )),
      ]);
}

