import 'package:api_singlechild_scrollview/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'apiFunctions.dart';
import 'details.dart';


class ShowAll extends StatefulWidget {
  const ShowAll({Key? key}) : super(key: key);

  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ApiTest")
      ),
      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20,10,20,0),
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              List snap = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:SpinKitFadingCube(
                      color: Colors.black,
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
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Details.set(snap[index])),
                              );
                            },
                            child: SizedBox(
                              width:200,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 35),
                                child: Text(
                                  snap[index]['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                deleteData(snap[index]["id"]);
                                Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => ShowAll(),
                                  ),
                                      (route) => false,
                                );
                                },
                              icon: Icon(
                                  Icons.delete
                              )
                          )
                        ],
                      ),
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
      drawer: drawer(context),
    );
  }
}

