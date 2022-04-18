
import 'dart:ui';

import 'package:camera/camera.dart';

class Constant{
  static var blueColor=const Color(0xff548fbb);
  static var orangeColor=const Color(0xfff8823c);
  static var blue2Color=const Color(0xffa4c4dc);
  static var orange2Color=const Color(0xfffbbd4e);
  static late CameraController controller;
  static List images = [];
  static var taughtby=3;
}

class Week{
  static List<String> weeks = [
    'Week 1',
    'Week 2',
    'Week 3',
    'Week 4',
    'Week 5',
    'Week 6',
    'Week 7',
    'Week 8',
    'Week 9',
    'Week 10',
    'Week 11',
    'Week 12',
    'Week 13',
    'Week 14',
    'Week 15',
    'Week 16'
  ];
}


findname(snap, name) {
  for (int i = 0; i < snap.length; i++) {
    if (snap[i]['FILENAME'].contains(name)) {
      return true;
    }
  }
  return false;
}

getIndex(snap, name) {
  for (int i = 0; i < snap.length; i++) {
    if (snap[i]['FILENAME'].contains(name)) {
      print("huehue");
      print(snap[i]['FILENAME'] + "     " + i.toString());
      return i;
    }
  }
}