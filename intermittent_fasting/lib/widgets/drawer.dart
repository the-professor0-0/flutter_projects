import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authScreens/login.dart';
import 'package:intermittent_fasting/screens/doctor/add_disease.dart';
import 'package:intermittent_fasting/screens/doctor/doctor_home.dart';
import 'package:intermittent_fasting/screens/doctor/view_disease.dart';
import 'package:intermittent_fasting/screens/user/add_item.dart';
import 'package:intermittent_fasting/screens/user/create_plan.dart';
import 'package:intermittent_fasting/screens/user/fasting_types.dart';
import 'package:intermittent_fasting/screens/user/set_disease.dart';
import 'package:intermittent_fasting/screens/user/user_home.dart';
import 'package:intermittent_fasting/screens/user/view_plan.dart';

import '../constant.dart';

Widget userDrawer(context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage('assets/avatar.png'),width: 100,),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            User.name.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.green, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            User.email.toLowerCase(),
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(const UserHome());
                      },
                      leading: const Icon(Icons.home),
                      title: const Text(
                        "Home",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const FastingTypes());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Fasting Types",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const CreatePlan());
                      },
                      leading: const Icon(Icons.add_comment_outlined),
                      title: const Text(
                        "Create Plan",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const ViewPlan());
                      },
                      leading: const Icon(Icons.remove_red_eye_outlined),
                      title: const Text(
                        "View Plan",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const SetDisease());
                      },
                      leading: const Icon(Icons.perm_identity_sharp),
                      title: const Text(
                        "SetDisease",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const AddItem());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Add Item",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(const Login());
                      },
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        "Logout",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget doctorDrawer(context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage('assets/avatar.png'),width: 100,),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            User.name.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.green, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            User.email.toLowerCase(),
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(const DoctorHome());
                      },
                      leading: const Icon(Icons.home),
                      title: const Text(
                        "Home",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const AddDisease());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Add Disease",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(const ViewDisease());
                      },
                      leading: const Icon(Icons.remove_red_eye_outlined),
                      title: const Text(
                        "View Disease",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(const Login());
                      },
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        "Logout",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
