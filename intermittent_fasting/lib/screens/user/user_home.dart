import 'package:flutter/material.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';


class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("User Home"),
      body: Center(
        child: Image.asset("assets/logoo.png",width: 300,),
      ),
      drawer: userDrawer(context),
    );
  }
}
