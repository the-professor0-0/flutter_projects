import 'package:biit_fms/screens/Teacher/Solution/quiz_sol.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'asg_sol.dart';
import 'exam_sol.dart';

class SolTabBar extends StatefulWidget {
  SolTabBar({Key? key}) : super(key: key);

  var snap;

  SolTabBar.set(this.snap);

  @override
  _SolTabBarState createState() => _SolTabBarState();
}

class _SolTabBarState extends State<SolTabBar> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appbar2(),
        body:TabBarView(
          children: [
            QuizSol.set(widget.snap),
            AsgSol.set(widget.snap),
            ExamSol.set(widget.snap),
          ],
        ),
      ),
    );
  }
}
