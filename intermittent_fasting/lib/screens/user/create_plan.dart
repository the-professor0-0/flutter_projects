import 'package:flutter/material.dart';
import 'package:intermittent_fasting/authMethods/api_methods.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';
import 'package:intermittent_fasting/constant.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';
import 'package:timezone/data/latest.dart' as tz;

class CreatePlan extends StatefulWidget {
  const CreatePlan({Key? key}) : super(key: key);

  @override
  _CreatePlanState createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlan> {
  TextEditingController name = new TextEditingController();
  TextEditingController calories = new TextEditingController();

  int radioValue = 1;
  String chosenValue = "1 Day";

  int alarmId = 1;

  DateTime? n;

  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
  }

  final formKey = GlobalKey<FormState>();

  TimeOfDay selectedTime = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones();
    viewAllowedIngredients();

    return Scaffold(
      appBar: appbar("Create Plan"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textField("Plan Name", name, context, false),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select Fasting Type:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              handleRadioValueChange(1);
                            }),
                        const Text(
                          '14 - Hours',
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
                          '16 - Hours',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      child: const Text("Choose Time"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Text(
                        "${selectedTime.hour}:${selectedTime.minute}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select Number Of Days:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                      value: chosenValue,
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        '1 Day',
                        '2 Days',
                        '3 Days',
                        '4 Days',
                        '5 Days',
                        '6 Days',
                        '7 Days',
                        '8  Days',
                        '9 Days',
                        '10 Days',
                        '11 Days',
                        '12 Days',
                        '13 Days',
                        '14 Days',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
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
                textField("Total Calories", calories, context, false),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      n = DateTime(now.year, now.month, now.day,
                          selectedTime.hour, selectedTime.minute);
                      Constants.calories.text = calories.text;
                      await addPlan(
                          name.text,
                          radioValue == 1 ? '14' : '16',
                          chosenValue,
                          calories.text,
                          (selectedTime.hour.toString() +
                                  ' : ' +
                                  selectedTime.minute.toString())
                              .toString(),
                          n);
                    },
                    child: const Text(
                      "Create Plan",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: userDrawer(context),
    );
  }
}
