import 'package:biit_fms/screens/Hod/common_topics.dart';
import 'package:biit_fms/screens/Teacher/contents.dart';
import 'package:biit_fms/screens/Teacher/SubFolder/sub_folder.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class SubTabs extends StatefulWidget {
  SubTabs({Key? key}) : super(key: key);

  var snap;
  SubTabs.set(var snap){
    this.snap=snap;
  }

  @override
  _SubTabsState createState() => _SubTabsState();
}

class _SubTabsState extends State<SubTabs> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: subTab(),
        body: TabBarView(
          children: [
            SubFolder.set(widget.snap),
            Contents.set(widget.snap),
            CommonTopics.set(widget.snap),
          ],
        ),
      ),
    );
  }
}
