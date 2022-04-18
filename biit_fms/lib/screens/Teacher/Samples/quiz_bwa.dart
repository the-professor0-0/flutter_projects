import 'package:biit_fms/widgets/card.dart';
import 'package:flutter/material.dart';

class QuizBwa extends StatelessWidget {
  QuizBwa({Key? key}) : super(key: key);
  var snap;
  QuizBwa.set(this.snap);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            bwaCard("Quiz 1",context,snap),
            bwaCard("Quiz 2",context,snap),
            bwaCard("Quiz 3",context,snap),
          ],
        )
    );
  }
}
