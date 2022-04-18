import 'package:flutter/material.dart';
import 'package:medsitnexus/includes/widgets.dart';

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: mainAppBar(),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40,),
                  Text(
                    'How MedsIT Nexus Inc. Works',
                    style: TextStyle(
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      color: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(height: 40,),
                  iconDisplay(Icons.check, 'Customized solutions'),
                  iconDisplay(Icons.check, 'Qualified Billers'),
                  iconDisplay(Icons.check, 'Reduction of billing expenses'),
                  iconDisplay(Icons.check, 'Flexibility'),
                  iconDisplay(Icons.check, 'Alerts'),
                  iconDisplay(Icons.check, 'Transition'),
                  iconDisplay(Icons.check, 'Billing Softwares'),
                  SizedBox(height: 40,),
                  Image( image: AssetImage('assets/howitworks.png'), ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      );
    }
}
