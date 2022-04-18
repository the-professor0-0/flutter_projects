import 'package:dollar/widgets/bottom_nav.dart';
import 'package:dollar/widgets/buttons.dart';
import 'package:dollar/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController pwd = TextEditingController();

  final formkey = GlobalKey<FormState>();

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
                      loginTextField(name, "First Name"),
                      const SizedBox(height: 10),
                      loginTextField(name, "Last Name"),
                      const SizedBox(height: 10),
                      loginTextField(name, "Phone #"),
                      const SizedBox(height: 10),
                      loginTextField(name, "Address"),
                      const SizedBox(height: 10),
                      loginTextField(pwd, "Password"),
                      const SizedBox(height: 20),
                      loginTextField(pwd, "Confirm Password"),
                      const SizedBox(height: 20),
                      loginButton("Register","",context),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          Get.to(const Login());
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Already Have an Account. Login!",
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
