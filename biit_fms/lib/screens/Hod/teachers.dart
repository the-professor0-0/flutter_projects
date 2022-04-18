import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/screens/Hod/view_covered_topics.dart';
import 'package:biit_fms/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Teacher extends StatefulWidget {
  Teacher({Key? key}) : super(key: key);

  var snap;

  Teacher.set(this.snap);

  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FutureBuilder(
              future: getRespectiveTeacher(widget.snap['CourseNo']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var snap = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {}
                try {
                  return ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Constant.taughtby = snap.length;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width - 50,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Constant.blueColor.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 79,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snap[index]['Emp_firstname'] +
                                        ' ' +
                                        snap[index]['Emp_middle'] +
                                        ' ' +
                                        snap[index]['Emp_lastname'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    height: 1,
                                    color: Colors.blueGrey,
                                    width:
                                        MediaQuery.of(context).size.width - 150,
                                  ),
                                  Text(
                                    snap[index]['DISCIPLINE'] +
                                        ' - ' +
                                        snap[index]['SemC'].toString() +
                                        snap[index]['SECTION'],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  snap[index]['folder_type'].toUpperCase() !=
                                          'MASTER'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Get.to(()=>ViewCoveredTopics.set(snap[index]));
                                              },
                                              child: const Text("View Covered"),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    await setMaster(
                                                        snap[index]);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 120,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 12),
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                        colors: [
                                                          Constant.orangeColor,
                                                          Constant.orange2Color,
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      'Assign Master'
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Get.to(()=>ViewCoveredTopics.set(snap[index]));
                                              },
                                              child: Text("View Covered"),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await removeMaster(snap[index]);
                                                setState(() {});
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 120,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      Constant.blueColor,
                                                      Constant.blue2Color,
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  'Remove Master'.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                            Container(
                              height: 140,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 18),
                              color: snap[index]['folder_type'].toUpperCase() ==
                                      'MASTER'
                                  ? Colors.lightGreen
                                  : Colors.blueGrey,
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Text(
                                    snap[index]['folder_type'].toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
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
              }),
        ),
      ),
    );
  }
}
