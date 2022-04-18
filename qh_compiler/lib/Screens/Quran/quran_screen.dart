import 'package:flutter/material.dart';
import 'package:qh_compiler/Models/quran_model.dart';
import 'package:qh_compiler/dbHelpers/db_helper.dart';
import 'package:qh_compiler/stop_words.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({Key? key}) : super(key: key);

  var surahid;

  QuranScreen.set(this.surahid);

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Quran>>(
            future: DatabaseHelper.instance.getQuran(widget.surahid),
            builder: (BuildContext context,
                AsyncSnapshot<List<Quran>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return ListView(
                children: snapshot.data!.map((quran) {
                  return Column(
                    children: [
                      Text(quran.sid),
                      Text(quran.aid),
                      Text(quran.ayat),
                    ],
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
