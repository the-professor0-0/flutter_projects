import 'package:flutter/material.dart';

Widget loginTextField(String labeltext,IconData icon,TextEditingController controller){
  bool obs=false;
  if(labeltext=="Password"){
    obs=true;
  }
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: TextFormField(
      controller: controller,
      validator: (val) {
        if(labeltext=="Email"){
          return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val)
              ? null
              : "Please enter valid email";
        }
        if(labeltext=="Contact No."){
          return val.length>11 ? null : "Invalid password";
        }
        else{
          return val.length>4 ? null : "Invalid password";
        }
      },
      obscureText: obs,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Color(0xff7e1417), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Color(0xffa07a2c), width: 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: labeltext,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.black,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
    ),
  );
}



