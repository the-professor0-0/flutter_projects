import 'dart:convert';

import 'package:biit_fms/constants/emp.dart';
import 'package:biit_fms/widgets/checkbox_dropdown.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../helperMethods/get_methods.dart';

class Contents extends StatefulWidget {
  Contents({Key? key}) : super(key: key);
  var snap;

  Contents.set(this.snap);

  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  bool isChecked = false;
  String chosenValue = "Week 1";

  var stC;
  var sub;

  var id = [];
  var tid = [];
  var title = [];
  var boolval = [];

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
            if (sub[i]['id'].toString() == stC[j]['subtid'].toString() &&
                stC[j]['empno'].toString() == Emp.Emp_no.toString()) {
              boolVal = true;
            }
          } catch (e) {
          }
        }
        id.add(sub[i]['id'].toString());
        tid.add(sub[i]['tid'].toString());
        title.add(sub[i]['title'].toString());
        boolval.add(boolVal);
      } catch (e) {
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  sub = snapshot.data;
                  if (snapshot.hasError) {}
                  try {
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
                  stC = snapshot.data;
                  if (snapshot.hasError) {}
                  try {
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
                      return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(snap[index]['name'].toString()),
                            children: [
                              FutureBuilder(
                                future: getSubTopics(widget.snap['COURSE_NO']),
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
                                      physics:const NeverScrollableScrollPhysics(),
                                      itemCount: tid.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                       try{
                                         if(n.toString()==tid[index].toString()){
                                           return CheckBoxDropDown.set(
                                             snap2[index]['id'],
                                               boolval[index],
                                               title[index],
                                               snap2[index]['weekno']
                                                   .toString() !=
                                                   'null'
                                                   ? snap2[index]['weekno']
                                                   : chosenValue,
                                               snap2[index],
                                               widget.snap['aid']);
                                         }
                                         else{
                                           return Container();
                                         }
                                       }catch(e){
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
