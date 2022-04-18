import 'package:flutter/material.dart';

class Constant{
  static var blackColor=const Color(0xff000000);
  static var primaryColor=const Color(0xff192a53);
  static var colors = [];
  static var tos='';

  static var currentLoc="Admin";

  static var msg='';

  static genColors(length) {
    for (int i = 0; i < length; i++) {
      colors.add(Colors.blue);
    }
  }
  static changeColor(index,length) {
    Constant.colors.clear();
    for (int i = 0; i < length; i++) {
      if (i == index) {
        Constant.colors.add(Colors.green);
      } else {
        Constant.colors.add(Colors.blue);
      }
    }
  }

}

class User{
  static var id='';
  static var name='';
  static var cnic='';
  static var phno='';
  static var dsg='';
  static var img='';
}