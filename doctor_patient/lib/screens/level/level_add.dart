import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/buttons.dart';
import 'package:flutter/material.dart';

class LevelAdd extends StatefulWidget {
  const LevelAdd({Key? key}) : super(key: key);

  @override
  _LevelAddState createState() => _LevelAddState();
}

class _LevelAddState extends State<LevelAdd> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar3("Add Level"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked1,
                    onChanged: (value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked2,
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked3,
                    onChanged: (value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked4,
                    onChanged: (value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked5,
                    onChanged: (value) {
                      setState(() {
                        isChecked5 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked6,
                    onChanged: (value) {
                      setState(() {
                        isChecked6 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked7,
                    onChanged: (value) {
                      setState(() {
                        isChecked7 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mango',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),

              addButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
