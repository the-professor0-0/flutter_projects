import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:woocommerce/woocommerce.dart';

import 'loginScreens/signin_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool isLoggedInGoogle=false;
  bool isLoggedInFacebook = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  logout(context)async{
    // WooCommerce woocommerce = WooCommerce(
    //     baseUrl: 'https://developmenthub.xyz',
    //     consumerKey: 'ck_673ea1fe9ec293b5640cf4a3c96dff7eb6f534ea',
    //     consumerSecret: 'cs_7148dbf6e44c761770d61e0fbc54d30a0cd903da');
    //     woocommerce.logUserOut();
    _googleSignIn.signOut();
    facebookLogin.logOut();
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Signin_Up()
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: (){
                  logout(context);
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
    );
  }
}
