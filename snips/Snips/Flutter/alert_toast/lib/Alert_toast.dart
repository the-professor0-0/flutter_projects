import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Alert_toast extends StatefulWidget {
  const Alert_toast({Key? key}) : super(key: key);

  @override
  _Alert_toastState createState() => _Alert_toastState();
}

class _Alert_toastState extends State<Alert_toast> {
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
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('AlertDialog Title'),
                  content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('Show Dialog'),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap:(){
                print("TAp");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Sending Message"),
                ));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                  child: Text("SHOW TOAST")
              )
            )



          ],
        ),
      ),
    );
  }
}

