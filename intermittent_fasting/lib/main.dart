
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authScreens/login.dart';
import 'package:intermittent_fasting/widgets/notification_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
