import 'package:biit_fms/screens/Teacher/Questions/quiz_ques.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'asg_ques.dart';
import 'exam_ques.dart';

class QuesTabBar extends StatefulWidget {
  QuesTabBar({Key? key}) : super(key: key);

  var snap;

  QuesTabBar.set(this.snap);

  @override
  _QuesTabBarState createState() => _QuesTabBarState();
}

class _QuesTabBarState extends State<QuesTabBar> {
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
            QuizQues.set(widget.snap),
            AsgQues.set(widget.snap),
            ExamQues.set(widget.snap),
          ],
        ),
      ),
    );
  }
}
