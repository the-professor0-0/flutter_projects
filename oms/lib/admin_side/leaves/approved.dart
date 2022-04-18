import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';

class Approved extends StatefulWidget {
  const Approved({Key? key}) : super(key: key);

  @override
  _ApprovedState createState() => _ApprovedState();
}

class _ApprovedState extends State<Approved> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/mainback.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(5),
        child: FutureBuilder(
          future: getLeaves('approved'),
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
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
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
                          radius: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 50, child: Text("Name : ")),
                                Text(
                                    snap[index]['name'].toString().toUpperCase()),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 50, child: Text("From : ")),
                                Text(snap[index]['fromDate'].toString()),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 50, child: Text("To : ")),
                                Text(snap[index]['toDate'].toString()),
                              ],
                            ),

                          ],
                        ),
                        const SizedBox(width: 10,),
                      ],
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
    );
  }
}
