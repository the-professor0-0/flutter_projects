import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  var counter = 0;
  add(){
    setState(() {
      counter++;
    });
  }
  minus(){
    setState(() {
      counter--;
    });
  }
  reset(){
    setState(() {
      counter=0;
    });
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
          //these alignments work alternate in ROW
          //main axis -> horizontal
          //cross axis -> vertical

          children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blueAccent, // foreground
              ),
              onPressed: () {
                add();
              },
              child: Text('Text Button -> Add'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                minus();
              },
              child: Text('ElevatedButton -> Minus'),
            ),
            SizedBox(height: 10,),

            Text(
              counter.toString()
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          reset();
        },
        child: Icon(
          Icons.exposure_zero
        ),
      ),
    );
  }
}
