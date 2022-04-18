import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authMethods/api_methods.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text='hamna@gmail.com';
    password.text='12';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 30),
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logoo.png',width: 200,),
                textField("Username", email, context, false),
                textField("Password", password, context, true),
                ElevatedButton(
                  onPressed: () {
                    login(email.text, password.text, context);
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(const Signup());
                    },
                    child: const Text("Don't have an account... SIGNUP!!"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
