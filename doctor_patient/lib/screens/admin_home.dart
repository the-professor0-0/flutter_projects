import 'package:dollar/loginScreens/login.dart';
import 'package:dollar/screens/queue.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List names = ['kinza', 'areej', 'rabia', 'shaista'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Admin")),
        leading: GestureDetector(
          onTap: () {
            Get.offAll(const Login());
          },
          child: const Icon(Icons.logout),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                const Text('All Doctors'),
                ElevatedButton(
                    onPressed: () {
                      Get.to(const Queue());
                    },
                    child: const Text('Queue')),
              ],
            ),
            ListView.builder(
              itemCount: names.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return adminHomeCard(names[index], context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
