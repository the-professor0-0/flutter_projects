import 'package:flutter/material.dart';
import 'package:qh_compiler/Models/hadith.dart';
import 'package:qh_compiler/dbHelpers/db_helper.dart';

class HadeesScreen extends StatefulWidget {
  HadeesScreen({Key? key}) : super(key: key);


  var jildno;

  HadeesScreen.set(this.jildno);
  @override
  _HadeesScreenState createState() => _HadeesScreenState();
}

class _HadeesScreenState extends State<HadeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Hadith>>(
            future: DatabaseHelper.instance.getHadees(widget.jildno),
            builder: (BuildContext context,
                AsyncSnapshot<List<Hadith>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return ListView(
                children: snapshot.data!.map((hadith) {
                  return Column(
                    children: [
                      Text(hadith.jidlNo.toString()),
                      Text(hadith.hadeesNo.toString()),
                      Text(hadith.narrated.toString()),
                      Text(hadith.hadith.toString()),
                    ],
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
