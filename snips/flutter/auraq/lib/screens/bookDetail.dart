import 'dart:convert';
import 'package:auraq/screens/placeOrder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookDetail extends StatefulWidget {

  String product;
  BookDetail({this.product});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  var responseBody;
  var qty=0;

  getData() async{
    String url='https://auraqpublications.com/wp-json/wc/v3/products/'+widget.product+'?consumer_key=ck_b6861beee9817d3feaedb3865305a0c16960ee69&consumer_secret=cs_e69b60d0a7660132bd0205eb5ab7fd07e85f6f7e';
    //String url='https://developmenthub.xyz/wp-json/wc/v3/products/'+widget.product+'?consumer_key=ck_673ea1fe9ec293b5640cf4a3c96dff7eb6f534ea&consumer_secret=cs_7148dbf6e44c761770d61e0fbc54d30a0cd903da';
    var result=await http.get(Uri.encodeFull(url),headers:{"Accept":"application/json"});
    responseBody=json.decode(result.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/logo.png'), width: 100,),
      ),

      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]
            )
        ),
        padding: EdgeInsets.fromLTRB(20,10,20,0),
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:SpinKitSquareCircle(
                      color: Colors.white,
                      size: 50.0,
                    )
                );
              }
              if(snapshot.hasError){
                print("Error...Can't connect to server");
              }
              try{
                return PlaceOrder(responseBody:responseBody);
              }catch(Exception){
                return Center(
                  child: Text(
                    "Connection Error...\nPlease check your Internet connection...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                );
              }
            }
        ),
      ),
    );
  }
}



