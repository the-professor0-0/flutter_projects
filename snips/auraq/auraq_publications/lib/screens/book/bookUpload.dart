import 'package:fluttertoast/fluttertoast.dart';
import 'package:auraq_publications/widgets/drawerData.dart';
import 'package:auraq_publications/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

// ignore: must_be_immutable
class BookUpload extends StatefulWidget {
  BookUpload({Key key}) : super(key: key);

  @override
  _BookUploadState createState() => _BookUploadState();
}

class _BookUploadState extends State<BookUpload> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  bool valueFirst = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController pageController = new TextEditingController();
  TextEditingController titleController = new TextEditingController();

  var languageGroup = 0;
  File _file;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future getFile()async{
    FilePickerResult result = await FilePicker.platform.pickFiles();
    File file = File(result.files.single.path);
    setState(() {
      _file = file;
    });
  }

  void _uploadFile(filePath) async {
    String fileName = basename(filePath.path);
    try {
      var dio = Dio();
      dio.options.headers = {
        'content-Type': 'multipart/form-data',
        "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNmNiMTNhYjRiZTEyYjQ5NDU0N2JlMmQwZDViNDQ3MThiYzUxZDQ1ZTZhYzVkMTA3MzI2NTM4MTE4ZjZkZGNhOGQ0MTM3YzE1NDkxMWQ3N2UiLCJpYXQiOiIxNjExMjA5OTI4LjYwMzU4NSIsIm5iZiI6IjE2MTEyMDk5MjguNjAzNTkyIiwiZXhwIjoiMTY0Mjc0NTkyOC41MzEyNjMiLCJzdWIiOiIyOSIsInNjb3BlcyI6W119.a-irzYWmKch0O60W_W4PMv2kR-q9DLtiRd_s5sOzJ3M7Vcl6RV-HVgIPOVj5S4r-IYNATxpplDuL8SzjZ7_b9DkbwMfvSO17YnKCI-LMxrfjMnL9afIe85V3KyIyL6EIcpvlIrkKUW5qifHFQ8IkJV3QZf_yLGPCGFKZr0tY3sdL987tSohTgLJDoEjYr38mWt9hiYnjljaJr0QoVFqlyFBZhapZErlC711aO_ou37YFrL4BRi1515prFGWhEtcsHfY5pwRy-pPwuNjc7yz-f4YH7lyWYrZdDtB-3K1ioJRBr1SXwm0K_8zvbTEw5Yekh2KEMVGNq1jUlQFkSoLTCyePDQyy74E1-HeualXkhejGLvj8Hk4AVN1TrZ9B1GC7girr81WzG-h0gIFSXIy7tbDZvSxJvsnF_gLJPOHe-h0VigedFDX-ZEfxfJwpTSBG63kkWrq7cYoFfapk6bjK6zmqRnAe2zo4g0xYJtiO5VgedZ9ROYHk5F0BlT6_FzTXs5UgnWh717b26CnLYPVfImUtPgl-dJcmBNu-XWuwI4zyuiKkwjznPlCe9bLKI0kOJvyWSv0eUQ-yJUPiugA2PpZGf0zhiP-DpHVbzG-CABIkk6gMG_y7LAV3RebpnB5Lgmm2L60__TScmiNWyFupv9WMIrVeM3pYI1u8KE16Qx8"
      };
      FormData formData = FormData.fromMap({
        "author_id": 29,
        "book_title": titleController.text,
        "no_of_pages": pageController.text,
        "book_language": "English",
        "book_content": await MultipartFile.fromFile(
            filePath.path, filename: fileName),
      });
      var response = await dio.post("https://laravel.abdullahlatif.com/api/publishbook", data: formData);
      String res=response.data.toString();
      print(res);
      if(res=="{messsage: Book Successfully Published, status_code: 200}"){
        Fluttertoast.showToast(
            msg: "Successfully Uploaded",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else{
        Fluttertoast.showToast(
            msg: "Error!! Please try again later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }


    } catch (e) {
      print("Exception caught: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xff22a6b3),
              body: const DrawerData(),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xff311e70), Color(0xff32397f)])),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => _toggleAnimation(),
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: _animationController,
                              color: Colors.white,
                            ),
                          ),
                          Image(
                            image: AssetImage("assets/logo.png"),
                            width: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/mainBackground.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Form(
                            key: formKey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image(image: AssetImage("assets/logo_black.png"),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  loginTextField("Book Title", titleController),
                                  loginTextField("No of Pages", pageController),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: languageGroup,
                                        onChanged: (T) {
                                          setState(() {
                                            languageGroup = T;
                                          });
                                        },
                                      ),
                                      Text("English"),
                                      Radio(
                                        value: 2,
                                        groupValue: languageGroup,
                                        onChanged: (T) {
                                          setState(() {
                                            languageGroup = T;
                                          });
                                        },
                                      ),
                                      Text("Urdu"),
                                    ],
                                  ),
                                  _file == null
                                      ? Text('File Name : ')
                                      : Text(
                                          "File Name : " + basename(_file.path).toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      getFile();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Colors.blue),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.file_copy_outlined,color: Colors.white,),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Select PDF",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _uploadFile(_file);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Colors.green),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.upload_file,color: Colors.white,),
                                          SizedBox(width: 5,),
                                          Text(
                                            "Upload Book",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
