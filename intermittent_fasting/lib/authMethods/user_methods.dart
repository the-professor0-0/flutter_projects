import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/constant.dart';
import 'package:intermittent_fasting/screens/user/add_diet.dart';
import 'package:intermittent_fasting/widgets/notification_service.dart';
import 'ip.dart';

addPlan(name, type, days, calories, selectedTime,n) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/addPlan').toString();
  var response = await dio.post(url, data: {
    'planname': name,
    'fastingtype': type,
    'selectdays': days,
    'totalcalories': calories,
    'startTime': selectedTime,
    'userid': User.id
  });
  var res = jsonDecode(response.toString());
  NotificationService()
      .showNotification(
      1,
      "Intermittent Fasting",
      "Time to break your fast",
      n!.minute - DateTime.now().minute,res['id']);
  if (res != null) {
    Get.to(AddDiet.set(res));
  }
}

viewPlans() async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/viewPlan?id=' +
          User.id.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

userAddDisease(diseaseid) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/userAddDisease').toString();
  var response = await dio.post(url, data: {
    'userid': User.id,
    'diseaseid': diseaseid,
  });
  var res = jsonDecode(response.toString());
}

viewUserDisease() async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/viewUserDisease?id=' +
          User.id.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

userRemoveDisease(diseaseid) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/ifasting/api/ifasting/userRemoveDisease')
      .toString();
  var response = await dio.post(url, data: {
    'userid': User.id,
    'diseaseid': diseaseid,
  });
  var res = jsonDecode(response.toString());
}

addIngredients(Itemid, ingName, IngQty, IngUnit) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/addIngredients').toString();
  var response = await dio.post(url, data: {
    'ingName': ingName,
    'IngQty': IngQty,
    'IngUnit': IngUnit,
    'Itemid': Itemid,
  });
}

viewIngredients(itemid) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/viewIngredients?itemid=' +
          itemid.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

viewPlanItems(category) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/viewPlanItems?category=' +
          category)
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

addDiet(planId, itemName, calories, dayNo, qty, mealNo) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/addDiet').toString();
  var response = await dio.post(url, data: {
    'planId': planId,
    'itemName': itemName,
    'calories': calories,
    'dayNo': dayNo,
    'mealNo': mealNo,
    'qty': qty
  });
  var res = jsonDecode(response.toString());
  if (res != null) {}
}

removeDiet(planId, itemName, calories, dayNo, qty, mealNo) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/ifasting/api/ifasting/removeDiet').toString();
  var response = await dio.post(url, data: {
    'planId': planId,
    'itemName': itemName,
    'calories': calories,
    'dayNo': dayNo,
    'mealNo': mealNo,
    'qty': qty
  });
  var res = jsonDecode(response.toString());
  if (res != null) {}
}

viewPlanDetail(id) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/viewPlanDetail?id=' +
          id.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

activatePlan(planId) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/activatePlan?id=' +
          planId.toString())
      .toString();
  var response = await dio.post(url);
}

deactivatePlan(planId) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/ifasting/api/ifasting/deactivatePlan?id=' +
          planId.toString())
      .toString();
  var response = await dio.post(url);
}
