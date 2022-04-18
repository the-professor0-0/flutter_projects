import 'package:auraq/helperMethods/getMethods.dart';
import 'package:auraq/screens/authentication/resetSuccess.dart';
import 'package:auraq/screens/mainScreens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String mainUrl = "https://laravel.abdullahlatif.com";

login(context, formKey, String email, String password) async {
  String url = mainUrl + "/api/login";
  if (formKey.currentState.validate()) {
      Fluttertoast.showToast(
          msg: "Please Wait...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      try{
        var result = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "email": email,
            "password": password
            // "email":"abbk@gmail.com",
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
          getUser(res["token"], res["id"].toString()).then((user) {
            print(user);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Home.set(res["token"],user)
            ));
          });
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
  if (formKey.currentState.validate()) {
    Fluttertoast.showToast(
        msg: "Please Wait...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
    getUser(res["token"], res["id"].toString()).then((user) {
      print(user);
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Home.set(res["token"],user)
      ));
    });
  }

}

completeProfile(context,String token,var user, formKey,String fName,String lName,String penName,String city,String age,String cnic,String dob,String about,String friend,String publish,String book,String gender,String found,String socialMedia) async{
  if (formKey.currentState.validate()) {
    Fluttertoast.showToast(
        msg: "Please Wait...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    String url = mainUrl+"/api/author/fill_profile";
    var result = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "first_name":fName,
        "last_name":lName,
        "pen_name":penName,
        "city":city,
        "age":age,
        "date_of_birth":dob,
        "gender":gender,
        "cnic_passport":cnic,
        "about_author":about,
        "how_found_us":"facebook",
        "old_published_books":publish,
        "books":book
      }),
    );
    var res = json.decode(result.body);
    print(res);
    if(res["message"]=="User Information Successfully Updated"){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Home.set(token,user)
      ));
    }
    return res;
  }
}

resetPassword(context,formKey,String email) async{
  if (formKey.currentState.validate()) {
    Fluttertoast.showToast(
        msg: "Please Wait...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    String url = mainUrl+"/api/password/email";
    var result = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email":email,
        //"email":"ssde@gmail.com"
      }),
    );
    var res = json.decode(result.body);
    print(res);
    if(res["error"]!=null){
      Fluttertoast.showToast(
          msg: "Invalid Email Address",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => ResetSuccess()
      ));
    }
    return res;
  }
}
