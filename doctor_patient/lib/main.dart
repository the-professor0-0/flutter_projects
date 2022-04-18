import 'package:dollar/screens/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginScreens/about_us.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dollar Proj',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AboutUs(),
    );
  }
}
