import 'package:auraq/helperMethods/postMethods.dart';
import 'package:auraq/widgets/drawerNavigation.dart';
import 'package:auraq/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';

// ignore: must_be_immutable
class UploadBook extends StatefulWidget {
  UploadBook({Key key}) : super(key: key);
  var token,user;
  UploadBook.set(bearer,userData){
    token=bearer;
    user=userData;
  }

  @override
  _UploadBookState createState() => _UploadBookState();
}

class _UploadBookState extends State<UploadBook> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  bool valueFirst = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController pageController = new TextEditingController();
  TextEditingController titleController = new TextEditingController();

  var languageGroup = 1;
  File _file;
  String language="English";
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
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc','docx'],
    );
    File file = File(result.files.single.path);
    setState(() {
      _file = file;
    });
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
                body: DrawerData(widget.token,widget.user)
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
                            colors: [Color(0xff161d30),Color(0xff161d30)])),
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
                                            language="English";
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
                                            language="Urdu";
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
                                      uploadFile(context,widget.token,_file,titleController.text,pageController.text,language,widget.user);
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
