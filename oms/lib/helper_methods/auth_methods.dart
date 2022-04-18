import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_audio_record/admin_side/home_tabs/admin_home.dart';
import 'package:flutter_audio_record/office_boy_side/office_home.dart';
import 'package:flutter_audio_record/teacher_side/teacher_home.dart';
import '../constants.dart';
import 'ip.dart';
import 'package:flutter/material.dart';

login(name, pwd, context) async {
  try {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text("Logging In"),
            ],
          ),
        );
      },
    );
    var dio = Dio();
    String url = ('http://' +
            IP.ip +
            '/obms/api/obms/login?name=' +
            name +
            '&pwd=' +
            pwd)
        .toString();
    var response = await dio.get(url);
    var res = response.data;
    if (response.statusCode == 200) {
      User.id = res[0]['id'].toString();
      User.name = res[0]['name'].toString();
      User.cnic = res[0]['cnic'].toString();
      User.dsg = res[0]['designation'].toString();
      User.phno = res[0]['phno'].toString();
      User.img = res[0]['img'].toString();
      Navigator.pop(context);
      if (res[0]['designation'].toString().toLowerCase() == 'admin') {
        Get.offAll(() => const AdminHome());
      } else if (res[0]['designation'].toString().toLowerCase() == 'teacher') {
        Get.offAll(() => const TeacherHome());
      } else if (res[0]['designation'].toString().toLowerCase() == 'officeboy') {
        DateTime x = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
        print(res[0]['toDate'].toString()=='null');
        if (res[0]['toDate'].toString()!='null') {
          var y = res[0]['toDate'].split('-');
          DateTime z = DateTime(int.parse(y[0]), int.parse(y[1]), int.parse(y[2]));
          if (res[0]['allowedLogin'].toString() == '1' ||
              (x.isAtSameMomentAs(z) || x.isAfter(z))) {
            Get.offAll(() => const OfficeHome());
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  content: Text("Account Disabled"),
                );
              },
            );
          }
        }
        Get.offAll(() => const OfficeHome());
      }
    }
  } catch (e) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(e.toString()),
        );
      },
    );
  }
}
