import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medsitnexus/includes/widgets.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
          child: Container(
            //color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    homeCard(context,1 , Icons.whatshot , 'Offerings'),
                    homeCard(context,2 , Icons.cloud_done_outlined , 'Why Choose Us'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    homeCard(context,3 , Icons.work_outline_rounded, 'How It Works'),
                    homeCard(context,4 , Icons.local_offer_outlined, 'Services'),
                  ],
                ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: navigationBar(context,2),
    );
  }
}
