import 'dart:convert';
import 'package:auraq/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets.dart';
import 'package:http/http.dart' as http;

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  var date;
  var pageNo=1;

  getData() async{
    String url='https://auraqpublications.com/wp-json/wc/v3/orders?product=3552&per_page=50&page='+pageNo.toString()+'&consumer_key=ck_b6861beee9817d3feaedb3865305a0c16960ee69&consumer_secret=cs_e69b60d0a7660132bd0205eb5ab7fd07e85f6f7e';
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
                  child:SpinKitChasingDots(
                    color: Colors.white,
                    size: 50.0,
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
                    date=snap[index]['date_created'].split('T');
                    return orderCard(
                        context,
                        snap[index]['id'].toString(),
                        snap[index]['line_items'][0]['name'].toString(),
                        snap[index]['billing']['first_name'].toString()+" "+snap[index]['billing']['last_name'].toString(),
                        snap[index]['shipping']['city'].toString(),
                        snap[index]['line_items'][0]['quantity'].toString(),
                        snap[index]['total'].toString(),
                        date[0],
                        snap[index]['status'].toString()
                    );
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

      bottomNavigationBar: navigationBar(context, 1),

      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Search()),
          );
        },
      ),
    );
  }
}
