import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/screens/Hod/hod_check_box.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ViewCoveredTopics extends StatefulWidget {
  ViewCoveredTopics({Key? key}) : super(key: key);

  var snap;

  ViewCoveredTopics.set(this.snap);

  @override
  _ViewCoveredTopicsState createState() => _ViewCoveredTopicsState();
}

class _ViewCoveredTopicsState extends State<ViewCoveredTopics> {
  bool isChecked = false;
  String chosenValue = "Week 1";

  var stC;
  var sub;

  var id = [];
  var tid = [];
  var title = [];
  var boolval = [];

  var topicCount = [];
  var coverCount = [];

  var bb = [];

  genList(snap) {
    id.clear();
    tid.clear();
    title.clear();
    boolval.clear();
    for (int i = 0; i < sub.length; i++) {
      try {
        var boolVal = false;
        for (int j = 0; j < stC.length; j++) {
          try {
            if (sub[i]['id'].toString() == stC[j]['subtid'].toString()) {
              boolVal = true;
            }
          } catch (e) {}
        }
        id.add(sub[i]['id'].toString());
        tid.add(sub[i]['tid'].toString());
        title.add(sub[i]['title'].toString());
        boolval.add(boolVal);
      } catch (e) {}
    }
    print(boolval);
  }

  genBool() async {
    await getlistBool();
  }


  getlistBool(){
    bb.clear();
    for (int i = 0; i < 200; i++) {
      try {
        var b = false;
        if (topicCount[i].toString() == coverCount[i].toString()) {
          b = true;

        }
        bb.add(b);
      } catch (e) {
        bb.add(false);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    print(widget.snap);
    return Scaffold(
      appBar: simpleAppbar(),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              FutureBuilder(
                future: getSubTopics(widget.snap['COURSE_NO']),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    sub = snapshot.data;
                    if (snapshot.hasError) {}
                    return ListView.builder(
                      itemCount: 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container();
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
              FutureBuilder(
                future: getStCovered(widget.snap['aid']),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    stC = snapshot.data;
                    if (snapshot.hasError) {}
                    return ListView.builder(
                      itemCount: 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container();
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
              FutureBuilder(
                future: getCoverTopicCount(widget.snap['aid']),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    coverCount = snapshot.data;
                    if (snapshot.hasError) {}
                    return ListView.builder(
                      itemCount: 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container();
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
              FutureBuilder(
                future: getTopicSubCount(widget.snap['COURSE_NO']),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    topicCount = snapshot.data;
                    if (snapshot.hasError) {}
                    return ListView.builder(
                      itemCount: 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container();
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
              Expanded(
                child: FutureBuilder(
                  future: getTopics(widget.snap['COURSE_NO']),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var snap = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {}
                    try {
                      genBool();
                      return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          if (bb[index]) {
                            return ExpansionTile(
                              title: Row(
                                children: [
                                  Checkbox(
                                    value: bb[index],
                                    onChanged: (bool? value) {},
                                  ),
                                  Container(
                                      width: 150,
                                      child:
                                      Text(snap[index]['name'].toString())),
                                ],
                              ),
                              children: [
                                FutureBuilder(
                                  future:
                                  getSubTopics(widget.snap['COURSE_NO']),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    var snap2 = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (snapshot.hasError) {}
                                    try {
                                      genList(snap2);
                                      var n = snap[index]['tid'];
                                      return ListView.builder(
                                        physics:
                                        const NeverScrollableScrollPhysics(),
                                        itemCount: tid.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          try {
                                            if (n.toString() ==
                                                tid[index].toString()) {
                                              return HODCheckBox.set(
                                                  boolval[index],
                                                  title[index],
                                                  snap2[index],
                                                  widget.snap['aid']);
                                            } else {
                                              return Container();
                                            }
                                          } catch (e) {
                                            print(e);
                                            return Container();
                                          }
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
                                )
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: bb[index],
                                      onChanged: (bool? value) {},
                                    ),
                                    Container(
                                        width: 150,
                                        child:
                                        Text(snap[index]['name'].toString())),
                                  ],
                                ),
                                FutureBuilder(
                                  future:
                                      getSubTopics(widget.snap['COURSE_NO']),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    var snap2 = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (snapshot.hasError) {}
                                    try {
                                      genList(snap2);
                                      var n = snap[index]['tid'];
                                      return ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: tid.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          try {
                                            if (n.toString() ==
                                                tid[index].toString()) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: HODCheckBox.set(
                                                    boolval[index],
                                                    title[index],
                                                    snap2[index],
                                                    widget.snap['aid']),
                                              );
                                            } else {
                                              return Container();
                                            }
                                          } catch (e) {
                                            print(e);
                                            return Container();
                                          }
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
                                )
                              ],
                            );
                          }
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
            ],
          ),
        ),
      ),
    );
  }
}
