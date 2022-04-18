import 'package:flutter/material.dart';

import '../widgets.dart';

// ignore: must_be_immutable
class Phone extends StatelessWidget {
  TextEditingController phoneController=new TextEditingController();
  final formKey = GlobalKey<FormState>();


  Future addPhoneNumber() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/phone.png"),width: 150,),
                      SizedBox(height:20,),
                      Text("Enter your Phone number",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                        ),
                      ),
                      loginTextField("03xx-xxxxxxx",Icons.call,phoneController),
                      GestureDetector(
                        onTap: () {
                          addPhoneNumber();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
