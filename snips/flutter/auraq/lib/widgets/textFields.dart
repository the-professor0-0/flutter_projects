import 'package:flutter/material.dart';

Widget loginTextField(String label,controller) {
  bool obs=false;
  if(label=="Password"||label=="Password (min 6 char)"||label=="Confirm Password"){
    obs=true;
  }
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: TextFormField(
      validator: (val){
        if(label=="Email"){
          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
          null : "Please enter email";
        }
        else if(label=="Password"||label=="Password (min 6 char)"){
          return val.length>4 ? null : "Invalid password";
        }
        else{
          return val.length>0? null :"Field cannot be empty";
        }
      },
      controller: controller,
      obscureText: obs,
      cursorColor: Colors.black,
      style: TextStyle(
        color:  Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3),
        labelText: label,
        labelStyle: TextStyle(color:  Colors.black,),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Colors.black,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}

Widget txtField(txt, controller, error, type, icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: TextFormField(
      controller: controller,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: txt,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.black,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      validator: (val) {
        if (val.length == 0) {
          return error;
        } else {
          return null;
        }
      },
      keyboardType: type,
    ),

  );
}

Widget txtFieldDisabled(txt, type, icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: TextFormField(
      enabled: false,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: txt,
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

Widget profileTextField(String label,controller,String value) {
  bool obs=false;
  if(label=="Password"||label=="Password (min 6 char)") {
    obs = true;
  }
  var max=1;
  if(label=="About"){
    max=4;
  }
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: TextFormField(
      validator: (val){
          return val.length>0 ? null : "This Field can't be empty";
      },
      maxLines: max,
      controller: controller..text = value,
      obscureText: obs,
      cursorColor: Colors.black,
      style: TextStyle(
        color:  Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3),
        labelText: label,
        labelStyle: TextStyle(color:  Colors.black,),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Colors.black,),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}

