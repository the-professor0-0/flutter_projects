import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/screens/level/level_add.dart';
import 'package:dollar/screens/pa/pa_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appbar(title) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}

AppBar appbar2(title) {
  return AppBar(
    title: Center(child: Text(title)),
    actions: [
      GestureDetector(
          onTap: () {
            Get.offAll(const Login());
          },
          child: const Icon(Icons.logout)),
    ],
  );
}

AppBar appbar3(title) {
  return AppBar(
    title: Center(
      child: Text(title),
    ),
    actions: [
      title == 'Assistant' || title == 'Level'
          ? GestureDetector(
              onTap: () {
                if (title == 'Assistant') {
                  Get.to(const PaRegister());
                } else if (title == 'Level') {
                  Get.to(const LevelAdd());
                }
              },
              child: const Icon(Icons.add),
            )
          : GestureDetector(
              onTap: () {
                Get.offAll(const Login());
              },
              child: const Icon(Icons.logout),
            ),
    ],
  );
}
