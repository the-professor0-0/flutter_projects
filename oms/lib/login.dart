import 'package:flutter/material.dart';

import 'constants.dart';
import 'helper_methods/auth_methods.dart';
import 'widgets/text_fields.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = 'admin';
    pass.text = '1';
    print("fork it");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 150,
                ),
                const Text(
                  "BIIT Office Boy Management System",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                textfield("Username", name, Icons.person, context),
                textfield("Password", pass, Icons.vpn_key, context),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Constant.blackColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    login(name.text,pass.text,context);
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
