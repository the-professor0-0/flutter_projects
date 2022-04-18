import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:medsitnexus/includes/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {

  void _launchMap(String url) async{

    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not place call";
    }
  }

  void _launchCaller(int number) async{
    var url="tel:${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not place call";
    }
  }

  void _launchEmail(String emailId) async{
    var url='mailto:$emailId';
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not send Email";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40,),
                Text(
                  'MedsIT Nexus Inc. is a full Revenue Cycle Management company with outstanding services ranging from small to large, single or multi-specialty medical practices, Medical Groups, Ambulatory Services & Hospitals.',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20,),
                Text(
                  'Contact Us',
                  style: TextStyle(
                  color: Colors.indigo[900],
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap: (){
                    _launchMap('https://www.google.com/maps/place/Levittown,+NY,+USA/@40.7218037,-73.5501013,13z/data=!3m1!4b1!4m5!3m4!1s0x89c27e2b3ab6fc17:0x9bae3e61265d1a79!8m2!3d40.7259336!4d-73.5142921');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo[800]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Icon(Icons.location_on_outlined,size: 20,color: Colors.white,),
                        SizedBox(width: 20,),
                        Text('Levittown NY 11756' , style:TextStyle(fontSize: 16, color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    _launchCaller(5166651869);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo[800]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Icon(Icons.local_phone_outlined ,size: 20,color: Colors.white,),
                        SizedBox(width: 20,),
                        Text('(516) 665-1869' , style:TextStyle(fontSize: 16, color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    _launchEmail('Info@medsitnexus.com');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo[800]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Icon(Icons.mail ,size: 20,color: Colors.white,),
                        SizedBox(width: 20,),
                        Text('info@medsitnexus.com' , style:TextStyle(fontSize: 16, color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(context,4),
    );
  }
}
