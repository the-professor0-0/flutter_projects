import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:medsitnexus/subpages/howitworks.dart';
import 'package:medsitnexus/subpages/offerings.dart';
import 'package:medsitnexus/subpages/services_card.dart';
import 'package:medsitnexus/subpages/whychooseus.dart';

import '../about.dart';
import '../blog.dart';
import '../contact.dart';
import '../home.dart';
import '../services.dart';


CurvedNavigationBar navigationBar(context,indexNo){
  return CurvedNavigationBar(
    backgroundColor: Colors.indigo[900],
    items: <Widget>[
      Icon(Icons.info,size: 15,color: Colors.black,),
      Icon(Icons.design_services,size: 15,color: Colors.black,),
      Icon(Icons.home,size: 40,color: Colors.black,),
      Icon(Icons.add_comment_rounded,size: 15,color: Colors.black,),
      Icon(Icons.contacts,size: 15,color: Colors.black,),
    ],
    index: indexNo,
    height: 50,
    animationDuration: Duration(milliseconds: 200),
    animationCurve: Curves.bounceInOut,
    onTap: (index){
      if(index == 0){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => About(),
          ),
              (route) => false,
        );
      }
      if(index == 1){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Services(),
          ),
              (route) => false,
        );
      }
      if(index == 2){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
              (route) => false,
        );
      }
      if(index == 3){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Blog(),
          ),
              (route) => false,
        );
      }
      if(index == 4){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Contact(),
          ),
              (route) => false,
        );
      }
    },
  );
}

AppBar mainAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.indigo[900], //change your color here
    ),
      title: Center(
        child: Image(
            image: AssetImage(
              'assets/logo.png',
            ),
            width: 180,
            height: 100,
          ),
      ),
  );
}

Widget cardDisplay(IconData iconName,String title,String description){
  return Card(
    margin: EdgeInsets.fromLTRB(16, 16 , 16, 0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Icon(iconName, size:80, color:Colors.indigo[900]),
          SizedBox(height: 20,),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              color:Colors.indigo[900],
            ),
          ),
          SizedBox(height: 20,),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ),
  );
}

Widget iconDisplay(IconData iconName,String title){
  return Card(
    child: Container(
      //padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          Icon(iconName, size:30, color:Colors.indigo[900]),
          SizedBox(height: 20,),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color:Colors.indigo[900],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homeCard(context,int id ,IconData iconName,String title){
  return GestureDetector(
    onTap: (){
      if(id==1){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Offerings()));
      }
      if(id==2){
        Navigator.push(context,MaterialPageRoute(builder: (context) => WhyChooseUs()));
      }
      if(id==3){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HowItWorks()));
      }
      if(id==4){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ServicesCard()));
      }

    },
    child: Card(
      child: Container(
        width: 150,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300].withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Icon(iconName, size:50, color:Colors.indigo[900]),
            SizedBox(height: 18,),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color:Colors.indigo[900],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    ),
  );
}