import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/screens/doctor_home.dart';
import 'package:dollar/screens/patient/patient_detail.dart';
import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorArea extends StatefulWidget {
  const DoctorArea({Key? key}) : super(key: key);

  @override
  _DoctorAreaState createState() => _DoctorAreaState();
}

class _DoctorAreaState extends State<DoctorArea> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text("Collections"),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.to(const DoctorHome());
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(const Login());
            },
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            doctorAreaCard("Patient Registration",context),
            doctorAreaCard("PA Registration",context),
            doctorAreaCard("Practice",context),
            doctorAreaCard("Collections",context),
          ],
        )
      ),
    );
  }
}
