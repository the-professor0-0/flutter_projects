import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class InvoiceUpload extends StatefulWidget {
  @override
  _InvoiceUploadState createState() => _InvoiceUploadState();
}

class _InvoiceUploadState extends State<InvoiceUpload> {

  File _image;

  final GlobalKey<ScaffoldState> _scaffoldstate =
  new GlobalKey<ScaffoldState>();

  void _uploadFile(filePath) async {
    // Get base file name
    String fileName = basename(filePath.path);
    print("File base name: $fileName");
    try {
      FormData formData;
      //new FormData.from({"file": new UploadFileInfo(filePath, fileName)});
      Response response =
      await Dio().post("http://192.168.0.101/saveFile.php", data: formData);
      print("File upload response: $response");
      _showSnakBarMsg(response.data['message']);
    } catch (e) {
      print("Exception Caught: $e");
    }
  }

  void _showSnakBarMsg(String msg) {
    _scaffoldstate.currentState
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    _uploadFile(image);
    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 13, 0,0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff311e70),Color(0xff32397f)]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined, color: Colors.white,),
                ),
                SizedBox(width: 10,),
                Image(image: AssetImage("assets/logo.png"),width: 100,)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mainBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: _image == null ? Text('No image selected.',style: TextStyle(color: Colors.white,fontSize: 20),) : Image.file(_image),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width-70,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.green),
                child: Text(
                  "Upload Receipt",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
