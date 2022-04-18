import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  List names = ['kinza', 'areej', 'rabia', 'shaista'];
  List type = ['doctor', 'Mental patient', 'doctor', 'PA'];
  List id = ['Uid_1', 'Uid_2', 'Uid_2', 'Uid_2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2("All Users"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("All Users",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ListView.builder(
              itemCount: names.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return allUserCard(id[index],names[index],type[index],context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
