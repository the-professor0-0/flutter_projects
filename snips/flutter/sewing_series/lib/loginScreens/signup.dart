import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sewing_series/widgets.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController contactController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<http.Response> register() async {
    print("working");
    var result = await http.post(
      'https://sewingseries.abdullahlatif.com/wp-json/wp/v2/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc2V3aW5nc2VyaWVzLmFiZHVsbGFobGF0aWYuY29tIiwiaWF0IjoxNjA5MzkzNzE1LCJuYmYiOjE2MDkzOTM3MTUsImV4cCI6MTYwOTk5ODUxNSwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMSJ9fX0.DUvLuNAiADzhXXXUeQmeKQ2kYSvNjhVq94YCpeTUrR0',
      },
      body: jsonEncode({
        "email": "email@gmail.com",//emailController.text,
        "first_name": "fnameController.text",
        "last_name": "lnameController.text",
        "role": "subscriber",
        "username": "emailController.text",
        "password": "abcabc",//passwordController.text,
      }),
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/login.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logo_black.png'),
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          loginTextField("First Name",
                              Icons.person_outline_rounded, fnameController),
                          loginTextField("Last Name",
                              Icons.person_outline_rounded, lnameController),
                          loginTextField("Email", Icons.person_outline_rounded,
                              emailController),
                          loginTextField("Contact No. (03xx-xxxxxxx)",
                              Icons.person_outline_rounded, contactController),
                          loginTextField("Password (min 6 char)",
                              Icons.panorama_fish_eye, passwordController),
                          GestureDetector(
                            onTap: () {
                              register();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff7e1417)),
                              child: Text(
                                "REGISTER",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
