import 'package:flutter/material.dart';
import 'package:flutter_audio_record/admin_side/history_tabs/complain_history.dart';
import 'package:flutter_audio_record/admin_side/history_tabs/location_history.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../notifications.dart';

class ViewHistory extends StatefulWidget {
  const ViewHistory({Key? key}) : super(key: key);

  @override
  _ViewHistoryState createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar("Admin Home"),
        body:const TabBarView(
          children:[
            ComplainHistory(),
            LocationHistory()
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

    bottom:const TabBar(
      indicatorColor: Colors.blue,
      tabs:  [
        Tab(
          icon: Text(
            'Complain History',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Location History',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
