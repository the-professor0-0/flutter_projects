import 'package:auraq_publications/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("Ready to Publish \nYour Book ?",style: TextStyle(fontSize: 35, color: Colors.white),),
                  SizedBox(height: MediaQuery.of(context).size.height/3+80,),
                  SliderButton(
                      action: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      alignLabel:Alignment(0.1, 0),
                      width: MediaQuery.of(context).size.width-50,
                      height: 60,
                      buttonSize: 55,
                      vibrationFlag: false,
                      label: Text(
                        "Lets Publish",
                        style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: Icon(Icons.arrow_forward)
                  ),
                ],
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushReplacement(
            //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(
            //       left: 30,
            //       bottom: 40,
            //       right: 30,
            //     ),
            //     padding: EdgeInsets.all(15),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           "Let's Publish",
            //           style: TextStyle(
            //             fontSize: 18,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Icon(Icons.arrow_forward,size: 18,),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
