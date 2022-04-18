import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/screens/admin_home.dart';
import 'package:dollar/screens/doctor_home.dart';
import 'package:dollar/screens/patient_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loginButton(var label, var name, context) {
  return GestureDetector(
    onTap: () {
      if (label == "Register") {
        Get.to(const Login());
      } else if (label == "Login") {
        if (name == 'doctor') {
          Get.to(const DoctorHome());
        } else if (name == 'admin') {
          Get.to(const AdminHome());
        } else if (name == 'patient') {
          Get.to(const PatientHome());
        }
      }
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
      ),
    ),
  );
}

Widget registerButton(context) {
  return GestureDetector(
    onTap: () {
      Get.to(const DoctorHome());
      //login();
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "REGISTER",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget addButton(context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "ADD",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget optionButton(title, context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3 + 10,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
