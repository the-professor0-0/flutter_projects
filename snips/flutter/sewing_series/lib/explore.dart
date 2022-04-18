import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'loginScreens/signin_up.dart';

class Explore extends StatefulWidget {

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/sub1.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10,120,50,10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Image(image: AssetImage('assets/logo_white.png'),width: MediaQuery.of(context).size.width/2,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  AutoSizeText(
                    'Explore the new \nworld of Clothing',
                    style: TextStyle(fontSize: 40,color: Colors.white),
                    minFontSize: 30,
                    stepGranularity: 10,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Signin_Up()));
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: 30,
                  bottom: 40,
                  right: 30,
                ),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's Explore",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward,size: 18,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
