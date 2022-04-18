import 'dart:convert';
import 'package:auraq/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screens/home.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  String username="";
  String rank="";

  // ignore: missing_return
  Future<List> login() async{
    // final response =await http.post('http://192.168.18.150/web/auraaq/login.php',body: {
    //   'email' : emailController.text,
    //   'password' : passwordController.text
    // });
    // var dataUser=json.decode(response.body);
    // if (formKey.currentState.validate()) {
    //   if(dataUser.length!=0){
    //     setState(() {
    //       username=dataUser[0]['name'];
    //       rank=dataUser[0]['type'];
    //     });
    //     setData(username,rank);
    //     Navigator.pushReplacement(context, MaterialPageRoute(
    //         builder: (context) => Home()
    //     ));
    //   }
    // }
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/back2.jpg'),
                fit: BoxFit.cover,
              )
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/logo.png'),
              ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Please enter valid email";
                        },
                        cursorColor: Colors.white,
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 3),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height:20),
                      TextFormField(
                        validator: (val){
                          return val.length>2 ? null : "Invalid password";
                        },
                        controller: passwordController,
                        obscureText:true,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 3),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height:40),
                      GestureDetector(
                        onTap: (){
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
                          child: Text(
                            "LOGIN",
                          ),
                        ),
                      ),
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


