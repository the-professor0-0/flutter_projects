import 'package:flutter/material.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Doctor Home"),
      body: Center(
        child: Image.asset("assets/logoo.png",width: 300,),
      ),
      drawer: doctorDrawer(context),
    );
  }
}
