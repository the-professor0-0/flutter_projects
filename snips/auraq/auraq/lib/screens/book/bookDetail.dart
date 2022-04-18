import 'dart:io';
import 'package:auraq/helperMethods/getMethods.dart';
import 'package:auraq/screens/book/invoice.dart';
import 'package:auraq/widgets/cards.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:auraq/helperMethods/postMethods.dart';

// ignore: must_be_immutable
class BookDetail extends StatefulWidget {

  BookDetail({Key key}) : super(key: key);
  var user;
  var token;
  var book;

  BookDetail.set(token,book,user){
    this.token=token;
    this.user=user;
    this.book=book;
  }

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> with SingleTickerProviderStateMixin {
  File _file;
  int progress = 0;
  ReceivePort _receivePort = ReceivePort();
  static downloadingCallback(id, status, progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");
    sendPort.send([id, status, progress]);
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
  void initState() {
    // TODO: implement initState
    super.initState();
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      print(progress);
    });
    FlutterDownloader.registerCallback(downloadingCallback);
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
          child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        detailCard(context, widget.token, widget.book, widget.user),
                        GestureDetector(
                          onTap:() async{
                            downloadBook(widget.book);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.file_download,color: Colors.white,),
                                SizedBox(width: 4,),
                                Text(
                                  "Download Book",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        widget.book["status"]=="2"?GestureDetector(
                          onTap: () async {
                            await getFile();
                            reUploadFile(context,widget.token,_file,widget.book,widget.user);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file,color: Colors.white,),
                                SizedBox(width: 4,),
                                Text(
                                  "Reupload Book",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ):Text(""),
                        widget.book["status"]=="1"?GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Invoice.set(widget.token,widget.book, widget.user)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.insert_drive_file_outlined,color: Colors.white,),
                                SizedBox(width: 4,),
                                Text(
                                  "Generate Invoice",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ):Text(""),
                        SizedBox(height: 10,)
                      ],
                    )
                  ),
        ),
      ),
    );
  }
}
