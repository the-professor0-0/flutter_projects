import 'dart:convert';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

String mainUrl = "https://laravel.abdullahlatif.com";

getBooks(String token) async{
  String url=mainUrl+"/api/books";
  var result=await http.get(url,headers:{
    "Accept":"application/json",
    'Authorization': 'Bearer $token',
  });
  var responseBody=json.decode(result.body);
  return responseBody;
}

getOrders() async {
  String url ="https://auraq.dsouls.co/wp-json/wc/v3/?consumer_key=ck_b6861beee9817d3feaedb3865305a0c16960ee69&consumer_secret=cs_e69b60d0a7660132bd0205eb5ab7fd07e85f6f7e";
  var result = await http.get(
      Uri.encodeFull(url), headers: {"Accept": "application/json"});
  var responseBody = json.decode(result.body);
  return responseBody;
}

Future<dynamic> getUser(String token,String id) async{
  String url=mainUrl+"/api/user/"+id;
  var result=await http.get(url,headers:{
    'Authorization': 'Bearer $token',
  });
  var responseBody=json.decode(result.body);
  return responseBody;
}

downloadBook(var book)async{
  final status = await Permission.storage.request();
  if (status.isGranted) {
    final externalDir = await getExternalStorageDirectory();
    print(externalDir);
    Fluttertoast.showToast(
        msg: "Downloading...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    final id = await FlutterDownloader.enqueue(
      url: mainUrl+"/uploads/authorbooks/"+book["book_content"].toString(),
      savedDir: externalDir.path,
      fileName: book["book_content"].toString(),
      showNotification: true,
      openFileFromNotification: true,
    );
  } else {
    print("Permission deined");
  }
}

downloadInvoice(var book)async{
  final status = await Permission.storage.request();
  if (status.isGranted) {
    final externalDir = await getExternalStorageDirectory();
    print(externalDir);
    Fluttertoast.showToast(
        msg: "Downloading...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    final id = await FlutterDownloader.enqueue(
      url: mainUrl+"/uploads/authorbooks/"+book["book_content"].toString(),
      savedDir: externalDir.path,
      fileName: book["book_content"].toString(),
      showNotification: true,
      openFileFromNotification: true,
    );
  } else {
    print("Permission deined");
  }
}