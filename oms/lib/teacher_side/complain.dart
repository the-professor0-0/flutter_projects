import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';

import 'complain_msg.dart';

class Complain extends StatefulWidget {
  const Complain({Key? key}) : super(key: key);

  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Place Complain"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mainback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: getAllOfficeBoys(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              try {
                var snap = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {}
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snap.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=> ComplainMessage.set(snap[index]));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin:const EdgeInsets.symmetric(vertical: 10),
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
                                        snap[index]['img'])
                                    .toString(),
                              ),
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snap[index]['name'].toString().toUpperCase(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width / 2,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
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
      drawer: teacherDrawer(context),
    );
  }
}
