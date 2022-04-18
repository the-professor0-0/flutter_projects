import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qh_compiler/Screens/Hadees/hadees_screen.dart';

class HadeesMenu extends StatefulWidget {
  const HadeesMenu({Key? key}) : super(key: key);

  @override
  _HadeesMenuState createState() => _HadeesMenuState();
}

class _HadeesMenuState extends State<HadeesMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hadees"),
        backgroundColor: Color(0xffc06cec),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 9,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(HadeesScreen.set(index + 1));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Jild : "+(index+1).toString()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
