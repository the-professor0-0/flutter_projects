import 'package:biit_fms/widgets/card.dart';
import 'package:flutter/material.dart';

class AsgBwa extends StatelessWidget {
  AsgBwa({Key? key}) : super(key: key);

  var snap;
  AsgBwa.set(this.snap);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            bwaCard("Assignment 1",context,snap),
            bwaCard("Assignment 2",context,snap),
            bwaCard("Assignment 3",context,snap),
          ],
        )
    );
  }
}
