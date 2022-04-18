import 'package:api_singlechild_scrollview/apiFunctions.dart';
import 'package:api_singlechild_scrollview/showAll.dart';
import 'package:flutter/material.dart';

class UpdateStudent extends StatefulWidget {
  UpdateStudent({Key? key}) : super(key: key);

  var student;
  UpdateStudent.set(var data){
    student=data;
  }

  @override
  _UpdateStudentState createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  final formKey = GlobalKey<FormState>();

  TextEditingController idController=new TextEditingController();

  TextEditingController nameController=new TextEditingController();

  TextEditingController semesterController=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    idController.text=widget.student["id"].toString();
    nameController.text=widget.student["name"].toString();
    semesterController.text=widget.student["semester"].toString();


    return Scaffold(
      appBar: AppBar(
          title: Text("ApiTest")
      ),
      body: Container(
          width:  MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(20,10,20,0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                TextFormField(
                  enabled: false,
                    controller: idController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter ID',
                    ),
                    keyboardType: TextInputType.number
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Name',
                  ),
                ),
                TextFormField(
                    controller: semesterController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Semester',
                    ),
                    keyboardType: TextInputType.number
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      updateData(idController,nameController,semesterController);
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ShowAll(),
                        ),
                            (route) => false,
                      );
                    },
                    child: Text("Update STUDENT",style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          )
      ),
    );
  }
}

