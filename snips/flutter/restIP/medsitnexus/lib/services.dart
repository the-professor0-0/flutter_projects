import 'package:flutter/material.dart';
import 'includes/widgets.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: Container(
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "This is Services",
              style: TextStyle(
                  color: Colors.white
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: navigationBar(context,1),
    );
  }
}
