

import 'package:dio/dio.dart';

import '../constants.dart';
import 'ip.dart';

getAllTeachers() async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getAllTeachers').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

getAllOfficeBoys() async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getAllOfficeBoys').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

getFloors() async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getFloors').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

addFloor(name) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/addFloor').toString();
  var response = await dio.post(url,data:{
    'name':name,
  });
  var res = response.data;
  return res;
}

addLocation(name,floor) async {
  var dio = Dio();
  String url = ('http://' +
      IP.ip +
      '/obms/api/obms/addLocation')
      .toString();
  var response = await dio.post(url,data:{
    'name':name,
    'floor':floor,
  });
  var res = response.data;
}


getLeaves(status) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getLeaves?status='+status.toString()).toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

updateStatus(id,status) async {
  var dio = Dio();
  String url = ('http://' +
      IP.ip +
      '/obms/api/obms/updateStatus?id='+id.toString()+'&status='+status.toString())
      .toString();
  var response = await dio.post(url);
  var res = response.data;
}

addAssign(asgto,asg) async {
  var dio = Dio();
  String url = ('http://' +
      IP.ip +
      '/obms/api/obms/addAssign')
      .toString();
  var response = await dio.post(url,data:{
    'assign':asg,
    'assignedTo':asgto
  });
  var res = response.data;
}

getAssign()async{
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getAssigned').toString();
  var response = await dio.get(url);
  var res = response.data;
  print(res);
  return res;
}

addNotification(msg,to)async{
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/addNotification').toString();
  var response = await dio.post(url,data: {
    'froms':User.id,
    'tos':to,
    'msg':msg
  });
  var res = response.data;
}

getLocationLogs() async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getLocationLogs').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

getNotification()async{
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getNotification?id='+User.id.toString()).toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}

getComplain()async{
  var dio = Dio();
  String url = ('http://' + IP.ip + '/obms/api/obms/getComplain').toString();
  var response = await dio.get(url);
  var res = response.data;
  return res;
}
