import 'package:api_singlechild_scrollview/navigation.dart';
import 'package:api_singlechild_scrollview/showAll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'apiFunctions.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {

  final formKey = GlobalKey<FormState>();
  TextEditingController idController=new TextEditingController();
  TextEditingController nameController=new TextEditingController();
  TextEditingController semesterController=new TextEditingController();



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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              TextFormField(
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
                    setData(idController,nameController,semesterController);

                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ShowAll(),
                      ),
                          (route) => false,
                    );
                  },
                  child: Text("ADD STUDENT",style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        )
      ),
      drawer: drawer(context),
    );
  }
}

