import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:sewing_series/loginScreens/phone.dart';
import 'dart:convert' as JSON;
import 'login.dart';


// ignore: camel_case_types
class Signin_Up extends StatefulWidget {
  @override
  _Signin_UpState createState() => _Signin_UpState();
}

// ignore: camel_case_types
class _Signin_UpState extends State<Signin_Up> {

  //GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool isLoggedInGoogle=false;
  bool isLoggedInFacebook = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  // loginWithGoogle() async{
  //   try{
  //     await _googleSignIn.signIn();
  //     setState(() {
  //       isLoggedInGoogle = true;
  //     });
  //     print(isLoggedInGoogle);
  //     print(_googleSignIn.currentUser.displayName);
  //     if(isLoggedInGoogle){
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //           builder: (context) => Home()
  //       ));
  //     }
  //   } catch (err){
  //     print(err);
  //   }
  // }
  loginWithFacebook() async{
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          isLoggedInFacebook = true;
        });
        if(isLoggedInFacebook){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Phone()
          ));
        }
        print(isLoggedInFacebook);
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isLoggedInFacebook = false );
        print(isLoggedInFacebook);
        break;
      case FacebookLoginStatus.error:
        setState(() => isLoggedInFacebook = false );
        print(isLoggedInFacebook);
        break;
    }

  }
  login(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/signinup.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo_white.png'),
                    width: 200,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 0, 20),
                    child: Text(
                      "Sign Up now\nGet 30% cashback\non first purchase",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap:(){
                              login();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check),
                                  SizedBox(width: 5,),
                                  Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          // GestureDetector(
                          //   onTap: (){
                          //     loginWithGoogle();
                          //   },
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     width: MediaQuery.of(context).size.width,
                          //     padding: EdgeInsets.symmetric(vertical: 18),
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Image(
                          //           image: AssetImage('assets/google-icon.png'),
                          //           width: 20,
                          //           height: 20,
                          //         ),
                          //         SizedBox(width: 5,),
                          //         Text(
                          //           'Log In with Google',
                          //           style: TextStyle(
                          //             color: Colors.black,
                          //             fontSize: 16,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 8,),
                          GestureDetector(
                            onTap: (){
                              loginWithFacebook();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Color(0xff2a5297),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/fb-icon.png'),
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    'Log In with Facebook',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
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
