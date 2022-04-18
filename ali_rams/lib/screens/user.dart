import 'package:ali_rams/authScreens/login.dart';
import 'package:ali_rams/widgets/bottom_nav.dart';
import 'package:ali_rams/widgets/card.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Constant.blueColor),
          backgroundColor: Colors.white,
          title: const Center(
            child: Image(
              image: AssetImage('assets/appbar.png'),
              width: 150,
            ),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(const Login());
                  },
                  child: Icon(
                    Icons.logout,
                    color: Constant.blueColor,
                  ),
                )),
          ]),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    image: const DecorationImage(
                        image: AssetImage('assets/avatar.jpg'))),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "John Doe",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Account #: 40128881881",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
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
              userCard("Email : johndoe@gmail.com", context, 0),
              userCard("Password :  ••••••••", context, 1),
              userCard("Contact # :40128881881", context, 0),
              userCard("Reference ID : 40128881881", context, 0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(context, 0),
    );
  }
}
