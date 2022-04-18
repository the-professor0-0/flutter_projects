import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/screens/doctor_area.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  List names = ['kinza', 'areej', 'rabia', 'shaista'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Today's Appointments")),
        leading: GestureDetector(
          onTap: () {
            Get.offAll(const Login());
          },
          child: const Icon(Icons.logout),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(const DoctorArea());
              },
              child: const Icon(Icons.app_registration)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: names.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return homeCard(names[index],context);
          },
        ),
      ),
    );
  }
}
