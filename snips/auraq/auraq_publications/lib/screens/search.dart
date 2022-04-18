import 'dart:convert';
import 'package:auraq_publications/widgets/cards.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final formKey = GlobalKey<FormState>();
  TextEditingController searchController=new TextEditingController();
  bool flag=false;
  var dataUser;
  var date;
  var msg="";
  var length=-1;
  int count=0;
  // ignore: missing_return
  Future<List> search() async{
    String url='';
    var response=await http.get(Uri.encodeFull(url),headers:{"Accept":"application/json"});
    setState(() {
      dataUser=json.decode(response.body);
      if(dataUser.length>0){
        flag=true;
        length=1;
      }
      else{
        msg="NOT FOUND";
        length=0;
        count=0;
      }
    });
  }

  // ignore: missing_return
  Widget searchList(){
    if(flag==true){
      flag=false;
      return ListView.builder(
        itemCount: dataUser.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
          date=dataUser[index]['date_created'].split('T');
          if(dataUser[index]['line_items'][0]['name'].toString().toLowerCase()==searchController.text.toLowerCase()){
            return orderCard(
                context,
                dataUser[index]['id'].toString(),
                dataUser[index]['line_items'][0]['name'].toString(),
                dataUser[index]['billing']['first_name'].toString()+" "+dataUser[index]['billing']['last_name'].toString(),
                dataUser[index]['shipping']['city'].toString(),
                dataUser[index]['line_items'][0]['quantity'].toString(),
                dataUser[index]['total'].toString(),
                date[0],
                dataUser[index]['status'].toString()
            );
          }
          else{
            print(count);
            return Container();
          }
        },
      );
    }
    else if(count==0){
      print("here it come");
      return Container(child: Center(child: Text(msg,style: TextStyle(color: Colors.white,fontSize: 20),),),);
    }
    else{
      msg="";
      return Container();
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 13, 0,0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff311e70),Color(0xff32397f)]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined, color: Colors.white,),
                ),
                SizedBox(width: 10,),
                Image(image: AssetImage("assets/logo.png"),width: 100,)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mainBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[600].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Form(
                  key: formKey,
                  child: Row(
                    children: [
                      SizedBox(width: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width-120,
                        child: TextFormField(
                          controller: searchController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 40,
                        height: 40,
                        child:GestureDetector(
                          onTap: (){
                            Fluttertoast.showToast(
                                msg: "Please Wait...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 8,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            search();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: Icon(Icons.search, color: Colors.black,size:20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20,10,20,0),
                  child: searchList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}