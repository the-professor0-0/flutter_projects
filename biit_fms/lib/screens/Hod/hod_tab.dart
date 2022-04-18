import 'package:biit_fms/screens/Hod/common_topics.dart';
import 'package:biit_fms/screens/Hod/weightage.dart';
import 'package:biit_fms/screens/Hod/teachers.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HodTab extends StatefulWidget {
  HodTab({Key? key}) : super(key: key);

  var snap;
  HodTab.set(this.snap);

  @override
  _HodTabState createState() => _HodTabState();
}

class _HodTabState extends State<HodTab> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: hodTab(),
        body:TabBarView(
          children:[
            Teacher.set(widget.snap),
            Weightage.set(widget.snap),
            CommonTopics.set(widget.snap),
          ],
        ),
      ),
    );
  }
}
