import 'dart:io';

import 'package:biit_fms/auth_screens/login.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/screens/Hod/hod_tab.dart';
import 'package:biit_fms/screens/Teacher/Master/master_tab.dart';
import 'package:biit_fms/screens/Teacher/SubFolder/sub_tab.dart';
import 'package:biit_fms/screens/Teacher/scanner.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../main.dart';

Widget subjectCard(context, snap) {
  Color? bgColor;
  if (snap['folder_type'].toLowerCase() == 'master') {
    bgColor = Colors.lightGreen;
  } else {
    bgColor = Colors.blueGrey[700];
  }
  snap['folder_type'] = snap['folder_type'].toUpperCase();
  return GestureDetector(
    onTap: () {
      switch (snap['folder_type'].toLowerCase()) {
        case 'master':
          Get.to(MasterTab.set(snap));
          break;
        case 'sub':
          Get.to(SubTabs.set(snap));
          break;
      }
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width - 50,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Constant.blueColor.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 79,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap['COURSE_NO'].toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: 1,
                  color: Colors.blueGrey,
                  width: MediaQuery.of(context).size.width - 150,
                ),
                Text(
                  snap['DISCIPLINE'].toString() +
                      ' - ' +
                      snap['SemC'].toString() +
                      snap['SECTION'].toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            color: bgColor,
            child: Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  snap['folder_type'].toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget expansionCard(title, type, snap, number) {
  return ExpansionTile(
    title: Text(title),
    children: [
      ElevatedButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf', 'doc'],
          );
          PlatformFile? file = result!.files.first;
          File uploader = File(file.path!);
          uploadFile(uploader, title + " " + type, number.toString(),
              snap['aid'].toString());
        },
        child: const Text('Upload File'),
      ),
    ],
  );
}

Widget hodSubjectCard(context, snap) {
  return GestureDetector(
    onTap: () {
      Get.to(HodTab.set(snap));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width - 50,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Constant.blueColor.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 79,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap['CourseDescription'],
                  style: const TextStyle(fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: 1,
                  color: Colors.blueGrey,
                  width: MediaQuery.of(context).size.width - 150,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bwaCard(title, context, snap) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        ElevatedButton(
          onPressed: () {
            showAlertDialog(title, context, snap);
          },
          child: const Text('Upload File'),
        ),
      ],
    ),
  );
}

showAlertDialog(title, context, snap) async {
  Widget bestButton = TextButton(
    child: const Text("Best"),
    onPressed: () async {
      Navigator.pop(context);
      showPicker(context,snap,title,"Best");
    },
  );

  Widget avgButton = TextButton(
    child: const Text("Average"),
    onPressed: () async {
      Navigator.pop(context);
      showPicker(context,snap,title,"Average");
    },
  );
  Widget worstButton = TextButton(
    child: const Text("Worst"),
    onPressed: () async {
      Navigator.pop(context);
      showPicker(context,snap,title,"Worst");
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Select Type First"),
    actions: [
      bestButton,
      avgButton,
      worstButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showPicker(context,snap,title,type) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child:  Wrap(
              children: <Widget>[
                 ListTile(
                    leading:const  Icon(Icons.photo_library),
                    title: const Text('Choose From Files'),
                    onTap: () {
                      fileFromFolder(snap,title,type);
                      Navigator.of(context).pop();
                    }),
                 ListTile(
                  leading:const  Icon(Icons.photo_camera),
                  title:const Text('Scan using Camera'),
                  onTap: () {
                    fileFromCam(snap,title,type);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}


fileFromCam(snap,title,type)async{
  await availableCameras().then(
        (value) => (
        Get.to(Scanner(cameras: value,snap: snap,name: title + " "+type,))
    ),
  );
}

fileFromFolder(snap,title,type)async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc'],
  );
  PlatformFile? file = result!.files.first;
  File uploader = File(file.path!);
  uploadFile(uploader, title + " "+type, '7', snap['aid'].toString());
}
