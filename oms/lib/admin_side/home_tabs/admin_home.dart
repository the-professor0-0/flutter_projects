import 'package:flutter/material.dart';
import 'package:flutter_audio_record/admin_side/home_tabs/all_officeboys.dart';
import 'package:get/get.dart';
import 'package:flutter_audio_record/admin_side/home_tabs/all_teachers.dart';
import 'package:flutter_audio_record/notifications.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';

import '../../constants.dart';
import 'assign_obs.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar("Admin Home"),
        body:const TabBarView(
          children:[
            AllTeachers(),
            AllOfficeBoys(),
            AssignObs(),
          ],
        ),
        drawer: adminDrawer(context),
      ),
    );
  }
}

AppBar appBar(title) {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.primaryColor),
    shadowColor: Constant.primaryColor,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title.toUpperCase(),
      style: TextStyle(color: Constant.primaryColor),
    ),
    // actions: [
    //   IconButton(
    //     onPressed: () {
    //       Get.to(()=>const AlertNotifications());
    //     },
    //     icon: Icon(
    //       Icons.notifications_active_outlined,
    //       color: Constant.primaryColor,
    //     ),
    //   )
    // ],
    bottom:const TabBar(
      indicatorColor: Colors.blue,
      tabs:  [
        Tab(
          icon: Text(
            'Teachers',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Office Boys',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Assign Boys',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
