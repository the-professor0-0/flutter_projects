import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../widgets.dart';


class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {

  var dataUser;
  var pageNo=1;
  getData() async{
    String url='https://auraqpublications.com/wp-json/wc/v3/products?per_page=15&consumer_key=ck_b6861beee9817d3feaedb3865305a0c16960ee69&consumer_secret=cs_e69b60d0a7660132bd0205eb5ab7fd07e85f6f7e';
    var result=await http.get(Uri.encodeFull(url),headers:{"Accept":"application/json"});
    var responseBody=json.decode(result.body);
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
              List snap = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:SpinKitFadingCube(
                      color: Colors.white,
                      size: 30.0,
                    )
                );
              }
              if(snapshot.hasError){
                print("Error...Can't connect to server");
              }
              try{
                return ListView.builder(
                  itemCount: snap.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return bookCard(context,snap[index]['id'],snap[index]['name'],snap[index]['price'],snap[index]['images'][0]['src'],snap[index]['date_created'].toString());
                  },
                );
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

      bottomNavigationBar: navigationBar(context, 2),
    );
  }
}
