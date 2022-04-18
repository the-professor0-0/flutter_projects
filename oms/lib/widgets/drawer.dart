import 'package:flutter/material.dart';
import 'package:flutter_audio_record/admin_side/add_location.dart';
import 'package:flutter_audio_record/admin_side/add_user.dart';
import 'package:flutter_audio_record/admin_side/history_tabs/view_history.dart';
import 'package:flutter_audio_record/admin_side/home_tabs/admin_home.dart';
import 'package:flutter_audio_record/admin_side/leaves/view_leaves.dart';
import 'package:flutter_audio_record/admin_side/view_complain.dart';
import 'package:flutter_audio_record/admin_side/view_obs.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';
import 'package:flutter_audio_record/office_boy_side/apply_leave.dart';
import 'package:flutter_audio_record/office_boy_side/office_home.dart';
import 'package:flutter_audio_record/teacher_side/complain.dart';
import 'package:flutter_audio_record/teacher_side/teacher_home.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../login.dart';

header() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              ('http://' + IP.ip + '/obms/files/' + User.img.toString())
                  .toString(),
            ),
            radius: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                User.name.toUpperCase(),
                style: TextStyle(
                  color: Constant.primaryColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                User.dsg.toLowerCase(),
                style: TextStyle(
                  color: Constant.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget obDrawer(context) {
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
              header(),
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
                        Get.offAll(() => const OfficeHome());
                      },
                      leading: const Icon(Icons.home),
                      title: const Text(
                        "Home",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const ApplyLeave());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Leave Application",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const Login());
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

Widget adminDrawer(context) {
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
              header(),
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
                        Get.offAll(() => const AdminHome());
                      },
                      leading: const Icon(Icons.home),
                      title: const Text(
                        "Home",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const AddUser());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Add User",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const AddLocation());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Add Location",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const ViewObs());
                      },
                      leading: const Icon(Icons.remove_red_eye_outlined),
                      title: const Text(
                        "View OB Locations",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const ViewHistory());
                      },
                      leading: const Icon(Icons.remove_red_eye_outlined),
                      title: const Text(
                        "Reportsip",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const ViewComplain());
                      },
                      leading: const Icon(Icons.remove_red_eye_outlined),
                      title: const Text(
                        "View Complains",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const ViewLeaves());
                      },
                      leading: const Icon(Icons.dashboard_outlined),
                      title: const Text(
                        "Manage Applications",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const Login());
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

Widget teacherDrawer(context) {
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
              header(),
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
                        Get.offAll(() => const TeacherHome());
                      },
                      leading: const Icon(Icons.home),
                      title: const Text(
                        "Home",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const Complain());
                      },
                      leading: const Icon(Icons.add),
                      title: const Text(
                        "Place Complain",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAll(() => const Login());
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