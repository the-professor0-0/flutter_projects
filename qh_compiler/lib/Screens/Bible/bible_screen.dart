import 'package:flutter/material.dart';
import 'package:qh_compiler/Models/quran_model.dart';
import 'package:qh_compiler/dbHelpers/db_helper.dart';

class BibleScreen extends StatefulWidget {
  BibleScreen({Key? key}) : super(key: key);

  var surahid;

  BibleScreen.set(this.surahid);
  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Quran>>(
            future: DatabaseHelper.instance.getBible(widget.surahid),
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
