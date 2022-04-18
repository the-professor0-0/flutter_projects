import 'dart:io';

import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/screens/Teacher/Samples/bwa_tab_bar.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scanner extends StatefulWidget {
  final List<CameraDescription>? cameras;
  var snap;
  var name;
  Scanner({this.cameras,this.snap,this.name, Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  XFile? pictureFile;

  bool flash = true;

  @override
  void initState() {
    super.initState();
    Constant.controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    Constant.controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    Constant.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!Constant.controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 270,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(Constant.controller),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    pictureFile != null
                        ? Image.file(
                            File(pictureFile!.path),
                            width: 40,
                          )
                        : Container(
                            width: 40,
                          ),
                    GestureDetector(
                      onTap: () async {
                        pictureFile = await Constant.controller.takePicture();
                        Constant.images.add(pictureFile);
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (flash) {
                          flash = false;
                          Constant.controller.setFlashMode(FlashMode.off);
                        } else {
                          flash = true;
                          Constant.controller.setFlashMode(FlashMode.torch);
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        child: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  List<File> files = [];
                  for (int i = 0; i < Constant.images.length; i++) {
                    files.add(File(Constant.images[i].path!));
                  }
                  await uploadPdf(context,files, widget.name, '7', widget.snap['aid'].toString());
                  files.clear();
                  Constant.images.clear();
                  Constant.controller.dispose();
                  Get.off(BwaTabBar.set(widget.snap));
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
