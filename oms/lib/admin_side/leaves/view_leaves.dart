import 'package:flutter/material.dart';
import 'package:flutter_audio_record/admin_side/leaves/pending.dart';
import 'package:flutter_audio_record/admin_side/leaves/rejected.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';
import '../../constants.dart';
import 'approved.dart';

class ViewLeaves extends StatefulWidget {
  const ViewLeaves({Key? key}) : super(key: key);

  @override
  _ViewLeavesState createState() => _ViewLeavesState();
}

class _ViewLeavesState extends State<ViewLeaves> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar("View Leaves"),
        body:const TabBarView(
          children:[
            Pending(),
            Approved(),
            Rejected()
          ],
        ),
        drawer: adminDrawer(context),
      ),
    );
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
          onPressed: () {},
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
              'Pending',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            icon: Text(
              'Approved',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            icon: Text(
              'Rejected',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

}
