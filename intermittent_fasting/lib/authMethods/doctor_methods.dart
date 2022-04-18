import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../screens/doctor/view_disease.dart';
import 'ip.dart';

addDisease(name) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/addDisease').toString();
  var response = await dio.post(url, data: {
    'name': name,
  });
  var res = jsonDecode(response.toString());
  if (res != null) {
    Get.offAll(const ViewDisease());
  }
}

viewDisease() async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/viewDisease').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

restrictIngredient(diseaseid, ingName, qty,unit) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/ifasting/api/ifasting/restrictIngredient')
      .toString();
  var response = await dio.post(url,
      data: {'diseaseid': diseaseid, 'ingName': ingName, 'qty': qty,'unit':unit});
}

viewRestrictedIngredients(id) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/viewRestrictedIngredients?id=' +
          id.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}
