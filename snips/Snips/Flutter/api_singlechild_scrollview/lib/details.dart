import 'package:api_singlechild_scrollview/update.dart';
import 'package:flutter/material.dart';


class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);

  var student;
  Details.set(var data)
  {
    student=data;
  }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("ID : "+student["id"].toString(),style: TextStyle(fontSize: 20),),
            Text("Name : "+student["name"],style: TextStyle(fontSize: 20),),
            Text("Semester : " + student["semester"].toString(),style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateStudent.set(student)),
          );
        },
        child: Icon(
            Icons.edit
        ),
      ),
    );
  }
}

