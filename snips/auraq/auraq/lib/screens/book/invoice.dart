import 'dart:io';
import 'package:auraq/helperMethods/getMethods.dart';
import 'package:auraq/helperMethods/postMethods.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Invoice extends StatefulWidget {
  String token;
  var book,user;
  Invoice.set(String token,var book,var user){
   this.token=token;
   this.book=book;
   this.user=user;
  }
  Invoice({Key key}) : super(key: key);
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {

  File _file;


  final formKey = GlobalKey<FormState>();
  TextEditingController copyController = new TextEditingController();
  TextEditingController pageController = new TextEditingController();

  bool coverDesign = false;
  bool formatting = false;
  bool design = false;
  bool amazon = false;
  bool bookMark = false;
  bool type = false;

  int total=0;
  int subtotal=0;
  int typeTotal=0;
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
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage('assets/logo.png'),
          width: 90,
        ),
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Color(0xff161d30),
      ),
      body: SingleChildScrollView(
        child: Container(
          width:  MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mainBackground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child:
          Container(
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
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 100),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                  onChanged: (String value){
                                    setState(() {
                                      total=0;
                                      int pages=int.parse(pageController.text);
                                      int copy=int.parse(copyController.text);
                                      if(copy>0 && copy<=30){
                                        total= (600+(60*((pages/50).round()-2)));
                                      }
                                      else if(copy>30 && copy<=50){
                                        total= (550+(60*((pages/50).round()-2)));
                                      }
                                      else if(copy>50 && copy<=100){
                                        total= (420+(60*((pages/50).round()-2)));
                                      }
                                      if(pages%50>0){
                                        total+=60;
                                      }
                                    });
                                  },
                                  controller: pageController,
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                    color:  Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 3),
                                    labelText: "No. of Pages",
                                    labelStyle: TextStyle(color:  Colors.black,),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:  Colors.black,),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                  onChanged: (String value){
                                    total=0;
                                    int pages=int.parse(pageController.text);
                                    int copy=int.parse(copyController.text);
                                    if(copy>0 && copy<=30){
                                      total= (600+(60*((pages/50).round()-2)));
                                    }
                                    else if(copy>30 && copy<=50){
                                      total= (550+(60*((pages/50).round()-2)));
                                    }
                                    else if(copy>50 && copy<=100){
                                      total= (420+(60*((pages/50).round()-2)));
                                    }
                                    if(pages%50>0){
                                      total+=60;
                                    }
                                  },
                                  controller: copyController,
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                    color:  Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 3),
                                    labelText: "No. of Copies (Range 30-100)",
                                    labelStyle: TextStyle(color:  Colors.black,),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:  Colors.black,),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Services",style: TextStyle(fontSize: 20),),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.coverDesign,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.coverDesign = value;
                                      if(value==true){
                                        subtotal+=3000;
                                      }
                                      else{
                                        subtotal-=3000;
                                      }
                                    });
                                  },
                                ),
                                Text ("Cover Design",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.formatting,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.formatting = value;
                                      if(value==true){
                                        subtotal+=2000;
                                      }
                                      else{
                                        subtotal-=2000;
                                      }
                                    });
                                  },
                                ),
                                Text ("Formatting",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.design,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.design = value;
                                      if(value==true){
                                        subtotal+=2000;
                                      }
                                      else{
                                        subtotal-=2000;
                                      }
                                    });
                                  },
                                ),
                                Text ("Inside Design Layout",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.amazon,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.amazon = value;
                                      if(value==true){
                                        subtotal+=7000;
                                      }
                                      else{
                                        subtotal-=7000;
                                      }
                                    });
                                  },
                                ),
                                Text ("Amazon KDP",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.bookMark,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.bookMark = value;
                                      if(value==true){
                                        subtotal+=2000;
                                      }
                                      else{
                                        subtotal-=2000;
                                      }
                                    });
                                  },
                                ),
                                Text ("Bookmark Print",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue,
                                  value: this.type,
                                  onChanged: (bool value) {
                                    setState(() {
                                      typeTotal=0;
                                      this.type = value;
                                      if(value==true){
                                        typeTotal+=int.parse(pageController.text)*100;
                                      }
                                      else{
                                        typeTotal=0;
                                      }
                                    });
                                  },
                                ),
                                Text ("Typing of Book",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            Divider(color: Colors.black,),
                            Text("Total : " + (total+subtotal+typeTotal).toString()),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                downloadInvoice(widget.book);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.blue),
                                child: Text(
                                  "Download Invoice",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () async{
                                await getFile();
                                uploadInvoice(context,widget.token,_file,widget.book,widget.user);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.green),
                                child: Text(
                                  "Upload Invoice",
                                  style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
