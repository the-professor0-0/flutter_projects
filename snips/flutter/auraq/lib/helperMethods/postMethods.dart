import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:auraq/screens/mainScreens/home.dart';

void uploadFile(context,token,filePath,String title,String page, String language,var user) async {
  String fileName = basename(filePath.path);
  try {
    print(user["data"]["id"]);
    var dio = Dio();
    dio.options.headers = {
      'content-Type': 'multipart/form-data',
      "Authorization":"Bearer "+token
    };
    FormData formData = FormData.fromMap({
      "author_id": user["data"]["id"],
      "book_title": title,
      "no_of_pages": page,
      "book_language": language,
      "book_content": await MultipartFile.fromFile(
          filePath.path, filename: fileName),
    });
    var response = await dio.post("https://laravel.abdullahlatif.com/api/publishbook", data: formData);
    var res=response.data.toString();
    print(res);
    if(res=="{messsage: Your book successfully published, status_code: 200}"){
      Fluttertoast.showToast(
          msg: "Successfully Uploaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Home.set(token,user)
      ));
    }
    else{
      Fluttertoast.showToast(
          msg: "Error!! Please try again later",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  } catch (e) {
    print("Exception caught: $e");
  }
}