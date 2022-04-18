import 'package:dollar/screens/collection/add_collection.dart';
import 'package:dollar/screens/doctor_area.dart';
import 'package:dollar/widgets/bottom_nav.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Letter extends StatefulWidget {
  const Letter({Key? key}) : super(key: key);

  @override
  _LetterState createState() => _LetterState();
}

class _LetterState extends State<Letter> {
  List names = ['a', 'b', 'c', 'd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child: Text("Collections"),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.offAll(const DoctorArea());
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(const AddCollection());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: names.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return letterCard(names[index],context);
          },
        ),
      ),
      bottomNavigationBar: bottomNav2(context,0),
    );
  }
}
