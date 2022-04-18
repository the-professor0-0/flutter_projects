import 'package:dollar/screens/collection/letter.dart';
import 'package:dollar/screens/level/levels.dart';
import 'package:dollar/screens/pa/pa_detail.dart';
import 'package:dollar/screens/patient/patient_detail.dart';
import 'package:dollar/screens/patient/patient_register.dart';
import 'package:dollar/screens/level/practice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget homeCard(name, context) {
  return GestureDetector(
    onTap: () {
      Get.to(const PatientDetails());
    },
    child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(name)),
  );
}

Widget doctorAreaCard(name, context) {
  var bgColor;
  switch (name) {
    case "Patient Registration":
      bgColor = Colors.blue;
      break;
    case "PA Registration":
      bgColor = Colors.grey;
      break;
    case "Practice":
      bgColor = Colors.orangeAccent;
      break;
    default:
      bgColor = Colors.lightBlueAccent;
      break;
  }

  return GestureDetector(
    onTap: () {
      switch (name) {
        case "Patient Registration":
          Get.to(const PatientRegister());
          break;
        case "PA Registration":
          Get.to(const PaDetail());
          break;
        case "Practice":
          Get.to(const Practice());
          break;
        default:
          Get.to(const Letter());
          break;
      }
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.edit_outlined,
              size: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget paCard(name, contact, context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(contact),
        ],
      ),
    ),
  );
}

Widget practiceCard(name, context) {
  var bgColor = Colors.blue;
  return GestureDetector(
    onTap: () {
      Get.to(const Level());
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        name,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  );
}

Widget letterCard(name, context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(name)),
  );
}

Widget queueCard(name, context) {
  return GestureDetector(
    onTap: () {
      //Get.to(const PatientDetails());
    },
    child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

          ],
        )),
  );
}

Widget allUserCard(id,name,type, context) {
  return GestureDetector(
    onTap: () {
      Get.to(const PatientDetails());
    },
    child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style:const TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type),
                  Text(id),
                ],
              ),
            ),
          ],
        )),
  );
}

Widget adminHomeCard(name, context) {
  return GestureDetector(
    onTap: () {
    },
    child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(name)),
  );
}
