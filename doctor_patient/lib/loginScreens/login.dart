import 'package:dollar/loginScreens/signup.dart';
import 'package:dollar/widgets/bottom_nav.dart';
import 'package:dollar/widgets/buttons.dart';
import 'package:dollar/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/doctor_home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController pwd = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool show = true;
  IconData icons=Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/back.jpg'),
            fit: BoxFit.fill,
          )),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/logo.png'),
                width: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        cursorColor: Colors.white,
                        controller: name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 3),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 150,
                            child: TextFormField(
                              obscureText: show,
                              cursorColor: Colors.white,
                              controller: pwd,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 3),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (show == false) {
                                  show = true;
                                  icons=Icons.visibility;
                                } else {
                                  show = false;
                                  icons=Icons.visibility_off_outlined;
                                }
                              });
                            },
                            icon: Icon(
                              icons,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      loginButton("Login",name.text, context),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          Get.to(const Signup());
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Don't Have an Account. Register Now!",
                            style: TextStyle(color: Colors.white),
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
      bottomNavigationBar: bottomNav(context, 2),
    );
  }
}
