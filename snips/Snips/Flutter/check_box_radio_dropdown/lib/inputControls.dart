import 'package:flutter/material.dart';

class InputControls extends StatefulWidget {
  const InputControls({Key? key}) : super(key: key);

  @override
  _InputControlsState createState() => _InputControlsState();
}

class _InputControlsState extends State<InputControls> {

  bool isChecked = false;
  int radioValue = 2;
  String chosenValue="Android";
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
        title: Text("Buttons"),
      ),
      body: Container(
        //sets width and height of container
        //MediaQuery.of(context).size.width/height sets width/height by getting size of screen
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(

          //for vertical alignment
          mainAxisAlignment: MainAxisAlignment.center,
          //for horizontal alignment
          crossAxisAlignment: CrossAxisAlignment.center,
          //these alignments work opposite in ROW
          //main axis -> horizontal
          //cross axis -> vertical

          children: [
            Row(
              //for horizontal alignment
              mainAxisAlignment: MainAxisAlignment.center,
              //for vertical alignment
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text('CheckBox'),
              ],
            ),
            SizedBox(height: 10,),
            Text(isChecked.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (value){
                    handleRadioValueChange(1);
                  }
                ),
                new Text(
                  'First',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 2,
                  groupValue: radioValue,
                    onChanged: (value){
                      handleRadioValueChange(2);
                    }
                ),
                new Text(
                  'Second',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Text(radioValue.toString()),
            DropdownButton<String>(
              value: chosenValue,
              iconEnabledColor:Colors.black,
              items: <String>[
                'Android',
                'IOS',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:TextStyle(color:Colors.black),),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  chosenValue = value!;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}