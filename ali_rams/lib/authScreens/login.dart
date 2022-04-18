import 'package:ali_rams/authScreens/register.dart';
import 'package:ali_rams/widgets/buttons.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:ali_rams/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constant.blueColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image:  AssetImage('assets/logox.png'),width: 150,),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Language"),
                    const SizedBox(
                      width: 10,
                    ),
                    ToggleSwitch(
                      minWidth: 50.0,
                      minHeight: 20.0,
                      initialLabelIndex: 0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      labels: const ['ENG', 'FR'],
                      borderWidth: 1.0,
                      cornerRadius: 0,
                      borderColor: const [Colors.blueGrey],
                      activeBgColors: [
                        [Constant.blueColor],
                        [Constant.orangeColor],
                      ],
                      onToggle: (index) {
                        // print('switched to: $index');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                loginTextfield("Name", username, Icons.person, context,false),
                loginTextfield("Password", password, Icons.vpn_key, context,true),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Constant.orangeColor),
                  ),
                ),
                loginbutton("LOGIN", context),
                GestureDetector(
                  onTap: (){
                    Get.to(Register());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account? ",
                        style: TextStyle(color: Constant.orangeColor),
                      ),
                      Text(
                        "Register Here",
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
