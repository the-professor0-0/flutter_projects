import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';
import 'package:intermittent_fasting/constant.dart';
import 'package:intermittent_fasting/screens/user/view_plan.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/item_card.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';

class AddDiet extends StatefulWidget {
  AddDiet({Key? key}) : super(key: key);

  var snap;

  AddDiet.set(this.snap);

  @override
  _AddDietState createState() => _AddDietState();
}

class _AddDietState extends State<AddDiet> {
  List<TextEditingController> controllerList = [];
  TextEditingController qty = TextEditingController();
  String dropdownValue = 'Fruits';
  String chosenValue = '1 Day';

  int radioValue = 1;

  List<String> totalDays = <String>[];

  bool isChecked = false;

  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
  }

  buildController(length) async {
    for (int i = 0; i < length; i++) {
      controllerList.add(TextEditingController());
    }
  }

  genList() {
    totalDays.clear();
    var x = widget.snap['selectdays'].split(' ');
    try {
      int n = int.tryParse(x[0])!;
      for (int i = 0; i < n; i++) {
        totalDays.add((i + 1).toString() + " Day");
      }
    } catch (e) {}
  }

  @override
  void initState() {
    Constants.calories.text = widget.snap['totalcalories'].toString();
    Constants.consumed.text = '0';
    genList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Add Diet"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              textField("Calories", Constants.calories, context, false),
              textField("Consumed", Constants.consumed, context, false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Food Category:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      'Fruits',
                      'Fast Food',
                      'Dishes',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Day:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: chosenValue,
                    iconEnabledColor: Colors.black,
                    items: totalDays.map((value) {
                      return DropdownMenuItem(
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        chosenValue = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Meal :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {
                            handleRadioValueChange(1);
                          }),
                      const Text(
                        'Meal 1',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: radioValue,
                          onChanged: (value) {
                            handleRadioValueChange(2);
                          }),
                      const Text(
                        'Meal 2',
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 280,
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
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: viewPlanItems(dropdownValue),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {}
                      if (snapshot.hasError) {}
                      buildController(snap.length);
                      return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return foodItem(snap[index], isChecked,
                              controllerList[index], dropdownValue);
                        },
                      );
                    } catch (e) {
                      return Center(
                        child: Text(
                          e.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(const ViewPlan());
                },
                child: const Text('Complete Plan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget foodItem(snap, isChecked, controller, dpVal) {
    int c = 0;
    for (int i = 0; i < User.ingName.length; i++) {
      var index = snap['c'].indexWhere((element) =>
          element['IngName'].toString().toLowerCase() ==
          User.ingName[i].toString().toLowerCase());
      if (int.parse(snap['c'][index]['IngQty'].toString()) <=
          int.parse(User.qty[i].toString())) {
      } else {
        c = 1;
      }
    }
    if (c == 0) {
      return ItemCard.set(snap, isChecked, controller, chosenValue,radioValue,widget.snap['id']);
    } else {
      return Container();
    }
  }
}
