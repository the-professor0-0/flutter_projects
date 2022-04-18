import 'package:flutter/material.dart';
import 'package:qh_compiler/widgets/button.dart';

import '../../stop_words.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.addQuranDB();
    Constants.addBibleDB();
    Constants.addHadeesDB();
    Constants.readSynonym();
    print("CALLING ENDED");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back3.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  HomeButton(context, "QURAN"),
                  HomeButton(context, "HADITH"),
                  HomeButton(context, "BIBLE"),
                  HomeButton(context, "SYNONYMS"),
                  HomeButton(context, "SEARCH INDEXES"),
                  HomeButton(context, "SEARCH"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
