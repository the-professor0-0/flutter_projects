import 'package:ali_rams/widgets/app_bar.dart';
import 'package:ali_rams/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../widgets/constants.dart';

class MyQr extends StatefulWidget {
  const MyQr({Key? key}) : super(key: key);

  @override
  _MyQrState createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2(),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              const Text("John Doe",style: TextStyle(fontSize: 20),),
              const Text("Account #: 40128881881",style: TextStyle(fontSize: 16),),
              const SizedBox(height: 10,),
              QrImage(
                data: 'Ali_rams Flutter app',
                version: QrVersions.auto,
                size: 300,
                gapless: true,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: const Size(20, 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sendButton("Send", context),
                  sendButton("Scan", context),
                ],
              ),
              printButton("Print", context),
            ],
          ),
        ),
      ),
    );
  }
}
