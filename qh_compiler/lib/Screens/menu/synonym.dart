import 'package:flutter/material.dart';
import 'package:qh_compiler/Models/syn.dart';
import 'package:qh_compiler/dbHelpers/db_helper.dart';
import 'package:qh_compiler/widgets/textfields.dart';
import 'fileread_bible.dart';
import 'fileread_quran.dart';

class Synonym extends StatefulWidget {
  const Synonym({Key? key}) : super(key: key);

  @override
  _SynonymState createState() => _SynonymState();
}

class _SynonymState extends State<Synonym> {
  TextEditingController syno = TextEditingController();
  TextEditingController syn1 = TextEditingController();
  TextEditingController syn2 = TextEditingController();
  TextEditingController syn3 = TextEditingController();
  TextEditingController syn4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SYNONYM'),
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textField("Enter Word", syno, context),
                textField("Enter Synonym 1", syn1, context),
                textField("Enter Synonym 2", syn2, context),
                textField("Enter Synonym 3", syn3, context),
                textField("Enter Synonym 4", syn4, context),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 30.0,
                      child: ElevatedButton(
                        child: const Text("Add Synonym"),
                        onPressed: () async {
                          await DatabaseHelper.instance.addSynonym(Syn(
                            word: syno.text.toString(),
                            syn1: syn1.text.toString(),
                            syn2: syn2.text.toString(),
                            syn3: syn3.text.toString(),
                            syn4: syn4.text.toString(),
                          ));
                          setState(() {});
                          print('added');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent[100],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: FutureBuilder<List<Syn>>(
                    future: DatabaseHelper.instance.getSyn(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Syn>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: Text('Loading...'));
                      }
                      return ListView(
                        children: snapshot.data!.map((syn) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("WORD : " + syn.word.toString()),
                              Row(
                                children: [
                                  Text(syn.syn1.toString() + ', '),
                                  Text(syn.syn2.toString() + ', '),
                                  Text(syn.syn3.toString() + ', '),
                                  Text(syn.syn4.toString()),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
