import 'package:ali_rams/widgets/buttons.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:ali_rams/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController sellerId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constant.blueColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/logox.png'),
                  width: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                loginTextfield("Email", email, Icons.vpn_key, context, false),
                loginTextfield("Phone", phone, Icons.vpn_key, context, false),
                loginTextfield(
                    "Seller Ref. ID", sellerId, Icons.vpn_key, context, false),
                loginbutton("REGISTER", context),
                GestureDetector(
                  onTap: () {
                    Get.to(const Login());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Constant.orangeColor),
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Constant.orangeColor,
                        ),
                      ),
                    ],
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
