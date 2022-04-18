import 'package:dollar/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar3("Level"),
    );
  }
}
