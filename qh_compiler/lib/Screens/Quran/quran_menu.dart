import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qh_compiler/Screens/Quran/quran_screen.dart';
import 'package:qh_compiler/stop_words.dart';

class QuranIndex extends StatefulWidget {
  const QuranIndex({Key? key}) : super(key: key);

  @override
  _QuranIndexState createState() => _QuranIndexState();
}

class _QuranIndexState extends State<QuranIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 114,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(()=>QuranScreen.set(Constants.indexes[index]));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("SURAH No : "+Constants.indexes[index]),
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
