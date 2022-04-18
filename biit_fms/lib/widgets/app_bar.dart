import 'package:biit_fms/auth_screens/login.dart';
import 'package:biit_fms/constants/emp.dart';
import 'package:biit_fms/screens/Hod/hod_home.dart';
import 'package:biit_fms/screens/Teacher/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

AppBar simpleAppbar() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
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
        ),
      ),
    ],
  );
}

AppBar appbar(id) {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
      ),
    ),
    leading:Emp.roles.split(',').length>1? GestureDetector(
      onTap: () {
        if (id == 1) {
          Get.to(const HodHome());
        } else {
          Get.to(const Home());
        }
      },
      child: const Icon(Icons.loop_outlined),
    ):Container(),
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
        ),
      ),
    ],
  );
}

AppBar appbar2() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
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
        ),
      ),
    ],
    bottom: TabBar(
      indicatorColor: Constant.blueColor,
      tabs: const [
        Tab(
            icon: Text(
          'Quizzes',
          style: TextStyle(color: Colors.black),
        )),
        Tab(
            icon: Text(
          'Assignments',
          style: TextStyle(color: Colors.black),
        )),
        Tab(
            icon: Text(
          'Exam',
          style: TextStyle(color: Colors.black),
        )),
      ],
    ),
  );
}

AppBar appbar3() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
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
        ),
      ),
    ],
    bottom: TabBar(
      indicatorColor: Constant.blueColor,
      tabs: const [
        Tab(
            icon: Text(
          'Quizzes',
          style: TextStyle(color: Colors.black),
        )),
        Tab(
            icon: Text(
          'Assignments',
          style: TextStyle(color: Colors.black),
        )),
        Tab(
            icon: Text(
          'Exam',
          style: TextStyle(color: Colors.black),
        )),
      ],
    ),
  );
}

AppBar masterTab() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
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
        ),
      ),
    ],
    bottom: TabBar(
      indicatorColor: Constant.blueColor,
      tabs: const [
        Tab(
          icon: Text(
            'Folder',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'CLOs',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Contents',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'C-Topics',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Other Teachers',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

AppBar subTab() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
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
        ),
      ),
    ],
    bottom: TabBar(
      indicatorColor: Constant.blueColor,
      tabs: const [
        Tab(
          icon: Text(
            'Folder',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'Contents',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          icon: Text(
            'C-Topics',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

AppBar hodTab() {
  return AppBar(
    iconTheme: IconThemeData(color: Constant.blueColor),
    backgroundColor: Colors.white,
    title: const Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        width: 50,
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
        ),
      ),
    ],
    bottom: TabBar(
      indicatorColor: Constant.blueColor,
      tabs: const [
        Tab(
            icon: Text(
          'Teachers',
          style: TextStyle(color: Colors.black),
        )),
        Tab(
            icon: Text(
          'CLOs',
          style: TextStyle(color: Colors.black),
        )),
        Tab(
            icon: Text(
              'Topics',
              style: TextStyle(color: Colors.black),
            )),
      ],
    ),
  );
}
