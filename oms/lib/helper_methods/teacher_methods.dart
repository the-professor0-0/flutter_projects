import 'package:dio/dio.dart';

import '../constants.dart';
import 'ip.dart';

getAssignedLocationLogs() async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/obms/api/obms/getAssignedLocationLogs?id=' +
          User.id.toString())
      .toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

addComplain(about, msg) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/addComplain').toString();
  var response = await dio.post(url,
      data: {"complainAbout": about, "msg": msg, "complainBy": User.id});
  var res = response.data;
  return res;
}
