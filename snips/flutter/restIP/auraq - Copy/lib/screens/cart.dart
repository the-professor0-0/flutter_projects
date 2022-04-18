import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Cart extends StatefulWidget {
  var id;
  var name;
  var price,qty;
  var image;
  Cart({this.id,this.name,this.price,this.qty,this.image});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/logo.png'), width: 100,),
      ),

      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]
            )
        ),
        padding: EdgeInsets.fromLTRB(20,10,20,0),
        child:SingleChildScrollView(
          child: Column(
            children: [
              bookCard2(context,widget.id,widget.name,widget.price,widget.image,widget.qty),
              form(context,widget.price,widget.qty),
            ],
          ),
        ),
      ),
    );
  }
}



