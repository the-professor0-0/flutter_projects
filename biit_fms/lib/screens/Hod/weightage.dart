import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:flutter/material.dart';

class Weightage extends StatefulWidget {
  Weightage({Key? key}) : super(key: key);

  var snap;

  Weightage.set(this.snap);

  @override
  _WeightageState createState() => _WeightageState();
}

class _WeightageState extends State<Weightage> {
  List<TextEditingController> midController = [];
  List<TextEditingController> finalController = [];
  List<TextEditingController> quiz1Controller = [];
  List<TextEditingController> quiz2Controller = [];
  List<TextEditingController> quiz3Controller = [];
  List<TextEditingController> asg1Controller = [];
  List<TextEditingController> asg2Controller = [];
  List<TextEditingController> asg3Controller = [];

  assignControllers(snap) {
    midController.clear();
    finalController.clear();
    quiz1Controller.clear();
    quiz2Controller.clear();
    quiz3Controller.clear();
    asg1Controller.clear();
    asg2Controller.clear();
    asg3Controller.clear();
    for (int i = 0; i < snap.length; i++) {
      midController.add(TextEditingController());
      finalController.add(TextEditingController());
      quiz1Controller.add(TextEditingController());
      quiz2Controller.add(TextEditingController());
      quiz3Controller.add(TextEditingController());
      asg1Controller.add(TextEditingController());
      asg2Controller.add(TextEditingController());
      asg3Controller.add(TextEditingController());
    }
    for (int i = 0; i < snap.length; i++) {
      midController[i].text = snap[i]['mid'];
      finalController[i].text = snap[i]['final'];
      quiz1Controller[i].text = snap[i]['quiz1'];
      quiz2Controller[i].text = snap[i]['quiz2'];
      quiz3Controller[i].text = snap[i]['quiz3'];
      asg1Controller[i].text = snap[i]['asg1'];
      asg2Controller[i].text = snap[i]['asg2'];
      asg3Controller[i].text = snap[i]['asg3'];
    }
  }

  final formkey = GlobalKey<FormState>();

  final myController = TextEditingController();

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
          child: Form(
            key: formkey,
            child: FutureBuilder(
              future: getClos(widget.snap['CourseNo']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                try {
                var snap = snapshot.data;
                assignControllers(snap);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                }
                  return ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(snap[index]['code'].toString()),
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Mid Exams"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: midController[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Final Exams"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: finalController[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Quiz 1"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: quiz1Controller[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Quiz 2"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: quiz2Controller[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Quiz 3"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: quiz3Controller[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Assignment 1"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: asg1Controller[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Assignment 2"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: asg2Controller[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Assignment 3"),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                        controller: asg3Controller[index],
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Constant.blue2Color,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constant.blueColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    updateWeightage(
                                        snap[index]['id'],
                                        midController[index].text,
                                        finalController[index].text,
                                        quiz1Controller[index].text,
                                        quiz2Controller[index].text,
                                        quiz3Controller[index].text,
                                        asg1Controller[index].text,
                                        asg2Controller[index].text,
                                        asg3Controller[index].text);
                                  },
                                  child: const Text('Update Weightage'),
                                )
                              ],
                            ),
                          )
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
        ),
      ),
    );
  }
}
