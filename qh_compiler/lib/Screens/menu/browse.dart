import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    var ischecked = false;

    List<String> op = [
      'please select translation',
      'urdu',
      'arabic',
      'english'
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('QURAN AND HADEES INDEXER'),
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      onChanged: null,
                      decoration:
                          InputDecoration(hintText: 'Enter Word Here...'),
                    ),
                  ),
                  TextButton(
                      onPressed: null,
                      child: Icon(
                        Icons.search,
                        color: Colors.amberAccent,
                      )),
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Text('Synonyms'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Text('Quran'),
                  SizedBox(width: 30),
                  DropdownButton<String>(
                    items: op.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: null,
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Text('Hadith'),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    items: op.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: null,
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  Text('Bible'),
                  SizedBox(width: 30),
                  DropdownButton<String>(
                    items: op.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: null,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 150.0,
                      height: 30.0,
                      child: ElevatedButton(
                        child: Text("Search"),
                        onPressed: () => print(""),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent[100],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
