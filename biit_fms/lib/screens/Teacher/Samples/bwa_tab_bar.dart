import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'asg_bwa.dart';
import 'exam_bwa.dart';
import 'quiz_bwa.dart';

class BwaTabBar extends StatefulWidget {
  BwaTabBar({Key? key}) : super(key: key);

  var snap;

  BwaTabBar.set(this.snap);

  @override
  _BwaTabBarState createState() => _BwaTabBarState();
}

class _BwaTabBarState extends State<BwaTabBar> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appbar2(),
        body: TabBarView(
          children: [
            QuizBwa.set(widget.snap),
            AsgBwa.set(widget.snap),
            ExamBwa.set(widget.snap),
          ],
        ),
      ),
    );
  }
}
