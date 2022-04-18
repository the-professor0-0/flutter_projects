import 'package:auraq_publications/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String mainUrl = "https://laravel.abdullahlatif.com";

login(context, formKey, String email, String password) async {
  String url = mainUrl + "/api/login";
  if (formKey.currentState.validate()) {
    try{
      var result = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "password": password
          // "email":"ab@gmail.com",
          // "password":"123456",
        }),
      );
      var res = json.decode(result.body);
      if (res["message"] == "You need to Login as Author") {
        Fluttertoast.showToast(
            msg: "You need to Login as Author",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else if (res["message"] == "UnAuthurized") {
        Fluttertoast.showToast(
            msg: "Invalid Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else if (res["token"] != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Home.set(res["token"])
        ));
      }
    }catch(e){
      Fluttertoast.showToast(
          msg: "Please check you internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }



}

register(context, formKey, String fName, String lName, String email, String contact, String password) async {
  String url = mainUrl+"/api/register";
  var result = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "first_name":fName,
      "last_name":lName,
      "email":email,
      "password":password,
      "phone_no":contact
    }),
  );
  var res = json.decode(result.body);
  print(res);
}

