import 'package:biit_fms/widgets/card.dart';
import 'package:flutter/material.dart';

class ExamBwa extends StatelessWidget {
  ExamBwa({Key? key}) : super(key: key);
  var snap;
  ExamBwa.set(this.snap);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            bwaCard("Mid Exam",context,snap),
            bwaCard("Final Exam",context,snap),
          ],
        )
    );
  }
}
