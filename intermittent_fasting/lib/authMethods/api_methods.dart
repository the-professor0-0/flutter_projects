import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/screens/doctor/doctor_home.dart';
import 'package:intermittent_fasting/screens/user/user_home.dart';
import 'package:intermittent_fasting/screens/user/view_plan.dart';

import '../constant.dart';
import '../screens/doctor/view_disease.dart';
import 'ip.dart';

login(var email, var pwd, context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children:const [
            CircularProgressIndicator(),
            SizedBox(width: 10,),
            Text("LOGGING IN"),
          ],
        ),
      );
    },
  );

  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/login?email=' +
          email +
          '&pwd=' +
          pwd)
      .toString();

  var response = await dio.post(url);
  var res = jsonDecode(response.toString());
  if (res.toString() != 'INVALID CREDENTIALS') {
    User.name = res['name'];
    User.email = res['email'];
    User.id = res['id'].toString();
    Navigator.pop(context);
    if (res['type'].toString().toLowerCase() == 'user') {

      Get.offAll(const UserHome());
    } else {
      Get.offAll(const DoctorHome());
    }
  }
}

viewAllowedIngredients() async {
  User.did.clear();
  User.ingName.clear();
  User.qty.clear();
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/viewAllowedIngredients')
          .toString();
  var response = await dio.get(url);
  var res = response.data;
  for(int i=0;i<res.length;i++){
    User.did.add(res[i]['diseaseid']);
    User.ingName.add(res[i]['ingName']);
    User.qty.add(res[i]['qty']);
  }
}

signup(name, email, pswd, type, context) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/ifasting/api/ifasting/signup').toString();
  var response = await dio.post(url,
      data: {'name': name, 'email': email, 'pswd': pswd, 'type': type});
  var res = jsonDecode(response.toString());
}
