import 'package:biit_fms/screens/Hod/common_topics.dart';
import 'package:biit_fms/screens/Teacher/Master/clos.dart';
import 'package:biit_fms/screens/Teacher/contents.dart';
import 'package:biit_fms/screens/Teacher/other_teachers.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'master.dart';

class MasterTab extends StatefulWidget {
  MasterTab({Key? key}) : super(key: key);

  var snap;
  MasterTab.set(var snap){
    this.snap=snap;
  }

  @override
  _MasterTabState createState() => _MasterTabState();
}

class _MasterTabState extends State<MasterTab> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: masterTab(),
        body: TabBarView(
          children: [
            Master.set(widget.snap),
            CLOS.set(widget.snap),
            Contents.set(widget.snap),
            CommonTopics.set(widget.snap),
            OtherTeachers.set(widget.snap),
          ],
        ),
      ),
    );
  }
}
