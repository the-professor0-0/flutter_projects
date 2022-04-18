import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';

class AssignObs extends StatefulWidget {
  const AssignObs({Key? key}) : super(key: key);

  @override
  _AssignObsState createState() => _AssignObsState();
}

class _AssignObsState extends State<AssignObs> {
  var teacher = 'Select Teacher';
  List<String> teacherList = [];
  List<String> tid=[];

  genTeacherDropdown(snap) {
    teacherList.clear();
    tid.clear();
    teacherList.add('Select Teacher');
    for (int i = 0; i < snap.length; i++) {
      teacherList.add(snap[i]['name']);
      tid.add(snap[i]['id'].toString());
    }
  }

  var ob = 'Select OfficeBoy';
  List<String> obList = [];
  List<String> obid=[];

  genobDropdown(snap) {
    obList.clear();
    obid.clear();
    obList.add('Select OfficeBoy');
    for (int i = 0; i < snap.length; i++) {
      obList.add(snap[i]['name']);
      obid.add(snap[i]['id'].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text(
                    "Teacher : ",
                  ),
                  FutureBuilder(
                    future: getAllTeachers(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      try {
                        var snap = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                        }
                        if (snapshot.hasError) {}
                        genTeacherDropdown(snap);
                        return DropdownButton<String>(
                          value: teacher,
                          items: teacherList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              teacher = val!;
                            });
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
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Officeboy : ",
                  ),
                  FutureBuilder(
                    future: getAllOfficeBoys(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      try {
                        var snap = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                        }
                        if (snapshot.hasError) {}
                        genobDropdown(snap);
                        return DropdownButton<String>(
                          value: ob,
                          items: obList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              ob = val!;
                            });
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
              const SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: ()async {
                  int tIndex=teacherList.indexWhere((element) => element == teacher);
                  int obIndex=obList.indexWhere((element) => element == ob);
                  await addAssign(tid[tIndex-1], obid[obIndex-1].toString());
                  setState(() {
                  });
                },
                child: const Text("Assign OfficeBoy"),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Assigned Office Boys",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Text("Office Boy",style: TextStyle(fontSize: 18),),
                          Text("Teacher",style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      const Divider(thickness: 2,color: Colors.black,),
                      FutureBuilder(
                        future: getAssign(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState == ConnectionState.waiting) {
                            }
                            if (snapshot.hasError) {}
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snap.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                print("SNAP : "+snap.toString());
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:75,
                                          child: Text(
                                            snap[index]['assign']
                                                .toString()
                                                .toUpperCase(),
                                          ),
                                        ),
                                        const Icon(Icons.arrow_forward,size: 20,),
                                        Text(
                                          snap[index]['assignedTo']
                                              .toString()
                                              .toUpperCase(),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                  ],
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
    );
  }
}
