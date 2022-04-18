import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/office_boy_methods.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  Color tColor = Colors.orange;

  compareDate(picked) {
    if (DateTime(picked.year, picked.month, picked.day).isAtSameMomentAs(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day)) ||
        DateTime(picked.year, picked.month, picked.day).isAfter(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day))) {
      return true;
    }
    return false;
  }

  Future<void> selectDate(val, BuildContext context) async {
    if (val == 'from') {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: fromDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && compareDate(picked)) {
        setState(() {
          fromDate = picked;
        });
      } else if (picked == null) {
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Text("Invalid Date"),
            );
          },
        );
      }
    } else {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: toDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && compareDate(picked)) {
        setState(() {
          toDate = picked;
        });
      } else if (picked == null) {
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Text("Invalid Date"),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Leave Application"),
      body: Container(
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 50,
                    child: Text("From : "),
                  ),
                  Text("${fromDate.toLocal()}".split(' ')[0]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => selectDate('from', context),
                    child: const Text('Select date'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 50,
                    child: Text("To : "),
                  ),
                  Text("${toDate.toLocal()}".split(' ')[0]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => selectDate('to', context),
                    child: const Text('Select date'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: ()async {
                  await addUserApplications(
                    toDate.toLocal().toString().split(' ')[0].toString(),
                    fromDate.toLocal().toString().split(' ')[0].toString(),
                  );
                  setState(() {});
                },
                child: const Text("Submit Application"),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 2,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Applications",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: getUserApplications(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                if (snap[index]['leaveStatus']
                                        .toString()
                                        .toLowerCase() ==
                                    'rejected') {
                                  tColor = Colors.red;
                                }
                                else if (snap[index]['leaveStatus']
                                        .toString()
                                        .toLowerCase() ==
                                    'approved') {
                                  tColor = Colors.green;
                                }
                                else if (snap[index]['leaveStatus']
                                    .toString()
                                    .toLowerCase() ==
                                    'pending') {
                                  tColor = Colors.orange;
                                }
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 50,
                                            child: Text("From : "),
                                          ),
                                          Text(snap[index]['fromDate']
                                              .toString()),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 50,
                                                child: Text("To : "),
                                              ),
                                              Text(snap[index]['toDate']
                                                  .toString()),
                                            ],
                                          ),
                                          Text(
                                            snap[index]['leaveStatus']
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(color: tColor),
                                          ),
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: obDrawer(context),
    );
  }
}
