import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../notifications.dart';

AppBar appbar(title) {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.primaryColor),
    shadowColor: Constant.primaryColor,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title.toUpperCase(),
      style: TextStyle(color: Constant.primaryColor),
    ),

    actions: [
      title.toString().toLowerCase()!='notification'?IconButton(
        onPressed: () {
          Get.to(()=>const AlertNotifications());
        },
        icon: Icon(
          Icons.notifications_active_outlined,
          color: Constant.primaryColor,
        ),
      ):Container(),
    ],
  );
}
