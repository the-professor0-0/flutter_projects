import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_record/audio/view.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:path_provider/path_provider.dart';

import '../constants.dart';

class SendNotification extends StatefulWidget {
  SendNotification({Key? key}) : super(key: key);

  var snap;

  SendNotification.set(this.snap);

  @override
  _SendNotificationState createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  TextEditingController msg = TextEditingController();

  var color = [];
  var tColor = [];

  late Directory? appDir;
  late List<String>? records;

  genColors() {
    color.clear();
    tColor.clear();
    for (int i = 0; i < 8; i++) {
      color.add(Colors.white);
      tColor.add(Colors.black);
    }
  }

  updateCard(index) {
    color.clear();
    tColor.clear();
    for (int i = 0; i < 8; i++) {
      if (i == index) {
        color.add(Colors.blue);
        tColor.add(Colors.white);
      } else {
        color.add(Colors.white);
        tColor.add(Colors.black);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    records = [];
    getExternalStorageDirectory().then((value) {
      appDir = value!;
      Directory appDirec = Directory("${appDir!.path}/Audiorecords/");
      appDir = appDirec;
      appDir!.list().listen((onData) {
        records!.add(onData.path);
      }).onDone(() {
        records = records!.reversed.toList();
        setState(() {});
      });
    });
    genColors();
  }

  @override
  void dispose() {
    appDir = null;
    records = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Constant.tos=widget.snap['userid'].toString();
    return Scaffold(
      appBar: appbar("Send Notification"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mainback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        textCard('ادھر آؤ', color[0], tColor[0], 0),
                        textCard('مجہے رپورٹ کرو', color[1], tColor[1], 1),
                        textCard('چاۓ لاؤ', color[2], tColor[2], 2),
                      ],
                    ),
                    Row(
                      children: [
                        textCard('پانی لاؤ', color[3], tColor[3], 3),
                        textCard('کھانا لاؤ', color[4], tColor[4], 4),
                        textCard('فوٹوکاپی کروا لو', color[5], tColor[5], 5),
                      ],
                    ),
                    Row(
                      children: [
                        textCard('ایڈمن رپورٹ کرو', color[6], tColor[6], 6),
                        textCard('پیپر لی آؤ', color[7], tColor[7], 7),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: msg,
                  cursorColor: Constant.blackColor,
                  style: TextStyle(
                    color: Constant.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Constant.blackColor,
                      size: 20,
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () async {
                            await addNotification(Constant.msg + " " + msg.text,
                                widget.snap['userid']);
                            Navigator.pop(context);
                          },
                        ),
                        InkWell(
                          child: Icon(Icons.mic),
                          onTap: () {
                            show(context);
                          },
                        ),
                      ],
                    ),
                    labelStyle: TextStyle(color: Constant.blackColor),
                    contentPadding: const EdgeInsets.all(5),
                    labelText: "Message",
                    fillColor: const Color(0xff548fbb),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Constant.blackColor,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Constant.blackColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  textCard(title, color, tColor, index) {
    return GestureDetector(
      onTap: () async {
        Constant.msg = title;
        await updateCard(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: tColor,
          ),
        ),
      ),
    );
  }

  _onFinish() {
    records!.clear();
    print(records!.length.toString());
    appDir!.list().listen((onData) {
      records!.add(onData.path);
    }).onDone(() {
      records!.sort();
      records = records!.reversed.toList();
      setState(() {});
    });
  }

  void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 125,
          color: Colors.white70,
          child: Recorder(
            save: _onFinish,
          ),
        );
      },
    );
  }
}
