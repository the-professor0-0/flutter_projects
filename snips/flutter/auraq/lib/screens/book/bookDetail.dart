import 'package:auraq/screens/book/placeOrder.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookDetail extends StatefulWidget {

  BookDetail({Key key}) : super(key: key);

  var user;
  var token;
  var id,name,desc,language,pages;

  BookDetail.set(token,user,id,name,desc,language,pages){
    this.token=token;
    this.user=user;
    this.id=id;
    this.name=name;
    this.desc=desc;
    this.language=language;
    this.pages=pages;
  }

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> with SingleTickerProviderStateMixin {

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
      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mainBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: PlaceOrder(id:widget.id.toString(),name:widget.name,desc:widget.desc,),
      ),
    );
  }
}
