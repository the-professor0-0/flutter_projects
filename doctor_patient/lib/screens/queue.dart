import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/screens/all_users.dart';
import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Queue extends StatefulWidget {
  const Queue({Key? key}) : super(key: key);

  @override
  _QueueState createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  List names = ['kinza', 'areej', 'rabia', 'shaista'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2("Queue"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 50,
                ),
                const Text("Today's Queue"),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const AllUsers());
                  },
                  child: const Text('All Users'),
                )
              ],
            ),
            ListView.builder(
              itemCount: names.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return queueCard(names[index], context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
