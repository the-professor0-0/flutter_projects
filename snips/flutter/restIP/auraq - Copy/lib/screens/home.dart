import 'package:flutter/material.dart';
import '../widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/logo.png'), width: 100,),
      ),

      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]
            )
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                dashboardCard(Icons.calendar_today_outlined , 'COPIES ORDERED', '382', Colors.blue),
                SizedBox(height: 10,),
                Row(
                  children: [
                    dashboardCard2(context,Icons.attach_money  , 'COMPLETED \nORDERS', '281', Colors.green),
                    SizedBox(width: 10,),
                    dashboardCard2(context,Icons.attach_money  , 'PAYABLE ROYALTY', 'PKR 129897', Colors.blue[800]),
                  ],
                ),
                SizedBox(height: 10,),
                dashboardCard(Icons.attach_money  , 'LAST PAID ROYALTY', 'PKR 0 \nPaid on: 0', Colors.yellow[800]),
              ],
            ),
          ),
        ),
      ),
      // drawer: drawer(context),
      bottomNavigationBar: navigationBar(context, 0),
    );
  }
}
