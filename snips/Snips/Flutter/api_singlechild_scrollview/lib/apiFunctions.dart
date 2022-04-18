import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

getData() async{
  String url='http://192.168.0.109/ApiTest2/api/student/getAllValues';
  var result=await http.get(Uri.parse(url),headers:{"Accept":"application/json"});
  var responseBody=jsonDecode(result.body);
  print(responseBody);
  return responseBody;
}

setData(TextEditingController id,TextEditingController name,TextEditingController semester) async{
  String url='http://192.168.0.109/ApiTest2/api/student/addValue';
  var result = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "id": id.text,
      "name": name.text,
      "semester":semester.text
    }),
  );
  var res = json.decode(result.body);
  print(res);
}

updateData(TextEditingController id,TextEditingController name,TextEditingController semester) async{
  String url='http://192.168.0.109/ApiTest2/api/student/ModifyValue';
  var result = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "id": id.text,
      "name": name.text,
      "semester":semester.text
    }),
  );
  var res = json.decode(result.body);
  print(res);
}

deleteData(var id) async{
  String url='http://192.168.0.109/ApiTest2/api/student/DeleteValue';
  var result = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "id": id,
    }),
  );
  var res = json.decode(result.body);
  print(res);
}