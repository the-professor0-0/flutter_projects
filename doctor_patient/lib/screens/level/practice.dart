import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar3("Practice"),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              practiceCard("Level 1",context),
              practiceCard("Level 2",context),
              practiceCard("Level 3",context),
            ],
          )
      ),
    );
  }
}
