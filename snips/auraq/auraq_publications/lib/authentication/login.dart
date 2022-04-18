import 'package:auraq_publications/authentication/register.dart';
import 'package:auraq_publications/helperMethods/authMethods.dart';
import 'package:auraq_publications/widgets/textFields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();

  // bool isLoggedInFacebook = false;
  // Map userProfile;
  // final facebookLogin = FacebookLogin();
  //
  // loginWithFacebook() async{
  //   final result = await facebookLogin.logInWithReadPermissions(['email']);
  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       final token = result.accessToken.token;
  //       final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
  //       final profile = JSON.jsonDecode(graphResponse.body);
  //       print(profile);
  //       setState(() {
  //         userProfile = profile;
  //         isLoggedInFacebook = true;
  //       });
  //       if(isLoggedInFacebook){
  //         Navigator.pushReplacement(context, MaterialPageRoute(
  //             builder: (context) => Home()
  //         ));
  //       }
  //       print(isLoggedInFacebook);
  //       break;
  //
  //     case FacebookLoginStatus.cancelledByUser:
  //       setState(() => isLoggedInFacebook = false );
  //       print(isLoggedInFacebook);
  //       break;
  //     case FacebookLoginStatus.error:
  //       setState(() => isLoggedInFacebook = false );
  //       print(isLoggedInFacebook);
  //       break;
  //   }
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/register.jpg'),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                          Image(
                            image: AssetImage('assets/logo_black.png'),
                            width: 200,
                          ),
                          SizedBox(height: 10,),
                          loginTextField("Email", emailController),
                          loginTextField("Password", passwordController),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              login(context,formKey,emailController.text,passwordController.text);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue
                              ),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              //loginWithFacebook();
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
                                    'FACEBOOK LOGIN ',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Don't have an account."),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => Register()
                                  ));
                                },
                                child: Text("Register!",style: TextStyle(decoration: TextDecoration.underline,),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}