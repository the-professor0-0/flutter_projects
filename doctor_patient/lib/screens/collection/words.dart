import 'package:dollar/widgets/bottom_nav.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../doctor_area.dart';
import 'add_collection.dart';

class Words extends StatefulWidget {
  const Words({Key? key}) : super(key: key);

  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  List names = ['Car', 'Boy', 'Keyboard', 'Elephant'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
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
            return letterCard(names[index], context);
          },
        ),
      ),
      bottomNavigationBar: bottomNav2(context, 1),
    );
  }
}
