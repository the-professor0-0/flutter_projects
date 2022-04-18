import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_audio_record/admin_side/send_notification.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';

class ViewObs extends StatefulWidget {
  const ViewObs({Key? key}) : super(key: key);

  @override
  _ViewObsState createState() => _ViewObsState();
}

class _ViewObsState extends State<ViewObs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("View Locations"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mainback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: FutureBuilder(
            future: getLocationLogs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              try {
                var snap = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {}
                if (snapshot.hasError) {}
                return ListView.builder(
                  itemCount: snap.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return snap[index]['dated'].toString() ==
                            DateTime.now()
                                .toLocal()
                                .toString()
                                .split(' ')[0]
                                .toString()
                        ? GestureDetector(
                            onTap: () {
                              Get.to(()=> SendNotification.set(snap[index]));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      ('http://' +
                                              IP.ip +
                                              '/obms/files/' +
                                              snap[index]['img'].toString())
                                          .toString(),
                                    ),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                              width: 70,
                                              child: Text("Name : ")),
                                          Text(snap[index]['name'].toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                              width: 70,
                                              child: Text("Location : ")),
                                          Text(snap[index]['location']
                                              .toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                              width: 70,
                                              child: Text("FLoor : ")),
                                          Text(
                                              snap[index]['floors'].toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                              width: 70,
                                              child: Text("Time : ")),
                                          Text(snap[index]['timed'].toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                );
              } catch (e) {
                return const Center(
                  child: Text(
                    "Connection Error...\nPlease check your Internet connection...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
      drawer: adminDrawer(context),
    );
  }
}
