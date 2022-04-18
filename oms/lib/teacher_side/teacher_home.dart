import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';

import '../constants.dart';
import '../notifications.dart';
import 'asg_obs.dart';
import 'view_all_obs.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar("Teacher Home"),
        body:const  TabBarView(
          children:[
            ViewAllObs(),
            AssignedOfficeBoys(),
          ],
        ),
        drawer: teacherDrawer(context),
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
    actions: [
      IconButton(
        onPressed: () {
          Get.to(()=>const AlertNotifications());
        },
        icon: Icon(
          Icons.notifications_active_outlined,
          color: Constant.primaryColor,
        ),
      )
    ],
    bottom:const TabBar(
      indicatorColor: Colors.blue,
      tabs:  [
        Tab(
          icon: Text(
            'Office Boys',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Assigned Boys',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
