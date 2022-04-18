import 'dart:convert';
import 'dart:io';

import 'package:biit_fms/constants/emp.dart';
import 'package:biit_fms/screens/Teacher/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GET;
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'ip.dart';

login(var empno, var pass, context) async {
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
    String url = ('http://' +
            IP.ip +
            '/fypApi/api/login/UserLogin?empno=' +
            empno +
            '&pass=' +
            pass)
        .toString();
    var result = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var res = json.decode(result.body);
    if (res != "INVALID CREDENTIALS") {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Emp.Emp_no = res['Emp_no'].toString();
      Emp.Emp_firstname = res['Emp_firstname'].toString();
      Emp.Emp_lastname = res['Emp_lastname'].toString();
      Emp.Emp_middle = res['Emp_middle'].toString();
      Emp.roles = res['roles'].toString();
      GET.Get.offAll(const Home());
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Text("Invalid Credentials"),
          );
        },
      );
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

getCourses() async {
  String url =
      ('http://' + IP.ip + '/fypApi/api/login/getcourses?empno=' + Emp.Emp_no)
          .toString();
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getAllCourses() async {
  String url =
      ('http://' + IP.ip + '/fypApi/api/login/getAllcourses').toString();
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getTopics(course) async {
  String url =
      ('http://' + IP.ip + '/fypApi/api/login/getTopics?COURSE_NO=' + course)
          .toString();
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getSubTopics(cid) async {
  String url =
  ('http://' + IP.ip + '/fypapi/api/login/getsubtopics?cid='+cid.toString())
      .toString();
  var result =
  await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}


getCoverTopicCount(aid) async {
  String url =
  ('http://' + IP.ip + '/fypapi/api/login/getCoverTopicCount?aid='+aid.toString())
      .toString();
  var result =
  await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

getTopicSubCount(cid) async {
  String url =
  ('http://' + IP.ip + '/fypapi/api/login/getTopicSubCount?cid='+cid.toString())
      .toString();
  var result =
  await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}



getStCovered(aid) async {
  String url =
  ('http://' + IP.ip + '/fypApi/api/login/getStCovered?aid=' + aid.toString())
      .toString();
  var result =
  await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}


getRespectiveTeacher(courseno) async {
  String url = ('http://' +
          IP.ip +
          '/fypApi/api/login/getRespectiveTeacher?courseno=' +
          courseno)
      .toString();
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

addClos(tid, clo) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/fypApi/api/login/addClos?tid=' +
          tid.toString() +
          '&clo=' +
          clo.toString())
      .toString();
  var response = await dio.post(url);
  print(response);
}

removeClos(tid, clo) async {
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/fypApi/api/login/removeClos?tid=' +
          tid.toString() +
          '&clo=' +
          clo.toString())
      .toString();
  var response = await dio.post(url);
  print(response);
}

getClos(cid) async {
  String url =
      ('http://' + IP.ip + '/fypApi/api/login/getClosWeight?cid=' + cid)
          .toString();
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

updateWeightage(id, mid, finals, quiz1, quiz2, quiz3, asg1, asg2, asg3) async {
  print(mid);
  var dio = Dio();
  String url = ('http://' +
          IP.ip +
          '/fypApi/api/login/updateWeightage?id=' +
          id.toString() +
          '&mid=' +
          mid.toString() +
          '&final=' +
          finals.toString() +
          '&quiz1=' +
          quiz1.toString() +
          '&quiz2=' +
          quiz2.toString() +
          '&quiz3=' +
          quiz3.toString() +
          '&asg1=' +
          asg1.toString() +
          '&asg2=' +
          asg2.toString() +
          '&asg3=' +
          asg3.toString())
      .toString();
  var response = await dio.post(url);
  print(response);
}

setMaster(snap) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/fypApi/api/login/setMaster').toString();
  var response = await dio.post(url, data: {
    'EMP_NO': snap['EMP_NO'],
    'COURSE_NO': snap['COURSE_NO'],
    'SEMESTER_NO': snap['SEMESTER_NO'],
    'SECTION': snap['SECTION'],
    'DISCIPLINE': snap['DISCIPLINE'],
    'SOS': snap['SOS'],
    'LEC1_DT': snap['LEC1_DT'],
    'LEC2_DT': snap['LEC2_DT'],
    'LEC3_DT': snap['LEC3_DT'],
    'SemC': snap['SemC'],
    'aid': snap['aid'],
    'folder_type': 'master',
  });
}

removeMaster(snap) async {
  var dio = Dio();
  String url =
      ('http://' + IP.ip + '/fypApi/api/login/removeMaster').toString();
  var response = await dio.post(url, data: {
    'EMP_NO': snap['EMP_NO'],
    'COURSE_NO': snap['COURSE_NO'],
    'SEMESTER_NO': snap['SEMESTER_NO'],
    'SECTION': snap['SECTION'],
    'DISCIPLINE': snap['DISCIPLINE'],
    'SOS': snap['SOS'],
    'LEC1_DT': snap['LEC1_DT'],
    'LEC2_DT': snap['LEC2_DT'],
    'LEC3_DT': snap['LEC3_DT'],
    'SemC': snap['SemC'],
    'aid': snap['aid'],
    'folder_type': 'sub',
  });
}

uploadFile(file, name, fid, aid) async {
  try {
    String uploadUrl = ('http://' +
            IP.ip +
            '/fypApi/api/login/UploadFile?name=' +
            name +
            '&fid=' +
            fid +
            '&aid=' +
            aid)
        .toString();
    Dio dio = Dio();
    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(file.path.toString())});
    var response = await dio.post(uploadUrl, data: formData);
    print(response);
  } catch (e) {
    print(e);
  }
}

getFiles(aid, fid) async {
  var responseBody = [];
  try {
    String url = ('http://' +
            IP.ip +
            '/fypApi/api/login/getFiles?aid=' +
            aid.toString() +
            '&fid=' +
            fid)
        .toString();
    var result =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    responseBody = jsonDecode(result.body);
  } catch (e) {
    print(e);
  }

  return responseBody;
}

deleteFile(aid, fid) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/fypApi/api/login/deleteFile').toString();
  var response = await dio.post(url, data: {'AID': aid, 'FID': fid});
}

uploadPdf(context, file, name, fid, aid) async {
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
            Text("Processing"),
          ],
        ),
      );
    },
  );
  try {
    String uploadUrl = ('http://' +
            IP.ip +
            '/fypApi/api/login/uploadPdf?name=' +
            name +
            '&fid=' +
            fid +
            '&aid=' +
            aid)
        .toString();
    Dio dio = Dio();
    Map<String, dynamic> hh = {};
    for (int i = 0; i < file.length; i++) {
      hh.addAll({
        name + i.toString():
            await MultipartFile.fromFile(file[i].path.toString())
      });
    }
    var formData = FormData.fromMap(hh);
    var response = await dio.post(uploadUrl, data: formData);
    print(response);
  } catch (e) {
    print(e);
  }
}

downloadFile(name) async {
  try {
    Dio dio = Dio();
    name = name.toString().replaceAll(' ', '%20');
    String downloadUrl =
        ('http://' + IP.ip + '/fypApi/files/' + name).toString();
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory(appDocDirectory.path + '/' + 'dir')
        .create(recursive: true)
        .then((Directory directory) async {
      print(directory.path);
      await dio.download(downloadUrl, directory.path + '/' + name);
      OpenFile.open(directory.path + '/' + name);
    });
  } catch (e) {
    print(e);
  }
}

addCovered(subtid, weekno, aid) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/fypApi/api/login/addCovered').toString();
  var response = await dio.post(url, data: {
    'empno': Emp.Emp_no,
    'weekno': weekno,
    'subtid': subtid,
    'aid': aid
  });
  print(response);
}

getCovered(tid) async {
  String url = ('http://' +
          IP.ip +
          '/fypApi/api/login/getCovered?tid=' +
          (tid.toString()))
      .toString();
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}

removeCovered(aid,stid) async {
  var dio = Dio();
  String url = ('http://' + IP.ip + '/fypApi/api/login/removeCovered?aid='+aid.toString()+'&stid='+stid.toString()).toString();
  var response = await dio.post(url);
  print(response);
}

getCommon(cid,cid2) async {
  String url='';
  if(cid.toString()!='null'){
    url = ('http://' +
        IP.ip +
        '/fypApi/api/login/getCommon?cid=' +
        (cid.toString()))
        .toString();
  }
  else{
    url = ('http://' +
        IP.ip +
        '/fypApi/api/login/getCommon?cid=' +
        (cid2.toString()))
        .toString();
  }
  var result =
      await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}


getOtherTeachers(cid) async {
  String url =
  ('http://' + IP.ip + '/fypApi/api/login/getOtherTeachers?cid=' + cid)
      .toString();
  var result =
  await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
  var responseBody = jsonDecode(result.body);
  return responseBody;
}
