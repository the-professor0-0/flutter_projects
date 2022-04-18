import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authMethods/api_methods.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  int radioValue = 2;

  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logoo.png',width: 200,),
                textField("Username", username, context, false),
                textField("Email", email, context, false),
                textField("Password", password, context, true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (value) {
                        handleRadioValueChange(1);
                      },
                    ),
                    const Text('Doctor'),
                    Radio(
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (value) {
                        handleRadioValueChange(2);
                      },
                    ),
                    const Text('User'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    signup(username.text, email.text, password.text,
                        radioValue == 1 ? 'doctor' : 'user', context);
                  },
                  child: const Text("Signup"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Login());
                    },
                    child: const Text("Already have an account... Login!!"),
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
