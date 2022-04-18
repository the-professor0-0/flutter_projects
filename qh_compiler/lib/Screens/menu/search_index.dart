import 'package:flutter/material.dart';
import 'package:qh_compiler/Models/hadith.dart';
import 'package:qh_compiler/Models/quran_model.dart';
import 'package:qh_compiler/Models/syn.dart';
import 'package:qh_compiler/dbHelpers/db_helper.dart';
import 'package:qh_compiler/widgets/textfields.dart';

import '../../stop_words.dart';

class SearchIndex extends StatefulWidget {
  SearchIndex({Key? key}) : super(key: key);
  var x = "";

  @override
  _SearchIndexState createState() => _SearchIndexState();
}

class _SearchIndexState extends State<SearchIndex> {
  TextEditingController controller = TextEditingController();

  int radioValue = 2;

  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('SEARCH INDEX'),
          backgroundColor: Colors.deepPurpleAccent[100]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  onChanged: (v) {
                    setState(() {});
                  },
                  controller: controller,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.all(5),
                    labelText: "Search Synonym",
                    fillColor: Color(0xff548fbb),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (value) {
                        handleRadioValueChange(1);
                      }),
                  const Text(
                    'Quran',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Radio(
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (value) {
                        handleRadioValueChange(2);
                      }),
                  const Text(
                    'Hadith',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                      value: 3,
                      groupValue: radioValue,
                      onChanged: (value) {
                        handleRadioValueChange(3);
                      }),
                  const Text(
                    'Bible',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              getFunc(),
            ],
          ),
        ),
      ),
    );
  }

  getFunc() {
    if (radioValue == 1) {
      return SizedBox(
        height: 500,
        child: FutureBuilder<List<Quran>>(
            future: DatabaseHelper.instance.searchIndexQuran(controller.text),
            builder:
                (BuildContext context, AsyncSnapshot<List<Quran>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return ListView(
                children: snapshot.data!.map((syn) {
                  return Column(
                    children: [
                      Text(syn.sid.toString()),
                      Text(syn.ayat.toString()),
                      Text(syn.ayat.toString()),
                    ],
                  );
                }).toList(),
              );
            }),
      );
    } else if (radioValue == 2) {
      return SizedBox(
        height: 500,
        child: FutureBuilder<List<Hadith>>(
            future: DatabaseHelper.instance.searchIndexHadith(controller.text),
            builder:
                (BuildContext context, AsyncSnapshot<List<Hadith>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return ListView(
                children: snapshot.data!.map((syn) {
                  return Column(
                    children: [
                      Text(syn.jidlNo.toString()),
                      Text(syn.hadeesNo.toString()),
                      Text(syn.narrated.toString()),
                      Text(syn.hadith.toString()),
                    ],
                  );
                }).toList(),
              );
            }),
      );
    } else {
      return SizedBox(
        height: 500,
        child: FutureBuilder<List<Quran>>(
            future: DatabaseHelper.instance.searchIndexBible(controller.text),
            builder:
                (BuildContext context, AsyncSnapshot<List<Quran>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return ListView(
                children: snapshot.data!.map((syn) {
                  return Column(
                    children: [
                      Text(syn.sid.toString()),
                      Text(syn.ayat.toString()),
                      Text(syn.ayat.toString()),
                    ],
                  );
                }).toList(),
              );
            }),
      );
    }
  }
}
