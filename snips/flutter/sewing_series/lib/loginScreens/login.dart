import 'package:flutter/material.dart';
import 'package:sewing_series/loginScreens/signup.dart';
import 'package:sewing_series/widgets.dart';
import 'package:woocommerce/woocommerce.dart';
import '../home.dart';
import 'package:fluttertoast/fluttertoast.dart';


// ignore: must_be_immutable
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formKey = GlobalKey<FormState>();


  userlogin() async{

    WooCommerce woocommerce = WooCommerce(
        baseUrl: 'https://sewingseries.abdullahlatif.com/',
        consumerKey: 'ck_90657950639fe7c6c982fedde352bf04dcf26f43',
        consumerSecret: 'cs_49b98a489298baad63894743dfb1c733fd352941');
    final token = await woocommerce.authenticateViaJWT(username: emailController.text, password: passwordController.text);
    print(token);
    bool isLoggedIn = await woocommerce.isCustomerLoggedIn();
    if(isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Home()
      ));
    }
    else{
      Fluttertoast.showToast(
          msg: "Error...Invalid Credentials!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/logo_black.png'),
                width: 200,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loginTextField("Email",Icons.person_outline_rounded,emailController),
                      loginTextField("Password",Icons.panorama_fish_eye,passwordController),
                      GestureDetector(
                        onTap: () {
                          userlogin();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff7e1417)
                          ),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an account? "),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signup()),
                              );
                            },
                            child: Text(
                              "Resigter Now",
                              style: TextStyle(decoration: TextDecoration.underline,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
