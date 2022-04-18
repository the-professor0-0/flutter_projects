import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {

  var inputval="hello";
  //gives form a specific key
  final formKey = GlobalKey<FormState>();

  //used for getting or setting the text field value
  TextEditingController inpController=new TextEditingController();

  reset(){
    inpController.text="";

    //refreshes the screen sets a new state for screen
    setState(() {
      inputval="";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFields"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //if you making a Form where you require save, reset, or validate operations- use TextFormField.
          // Else For Simple user input capture TextField is sufficient.
          Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: inpController,
                onChanged: (text){
                  setState(() {
                    inputval=text;
                  });
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
          ),
          Text(inputval),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          reset();
        },
        child: Text("RESET"),
      ),
    );
  }
}