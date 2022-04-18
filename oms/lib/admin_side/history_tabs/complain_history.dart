import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';


class ComplainHistory extends StatefulWidget {
  const ComplainHistory({Key? key}) : super(key: key);

  @override
  _ComplainHistoryState createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            future: getComplain(),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 120,
                                child: Text("Complain From : ",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Text(snap[index]['complainBy'].toString().toUpperCase()),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 120,
                                child: Text("Complain Of : ",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Text(snap[index]['complainof'].toString().toUpperCase()),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 120,
                                child: Text("COMPLAIN : ",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Text(snap[index]['msg'].toString().toUpperCase()),
                            ],
                          ),
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
      ),
    );
  }
}
