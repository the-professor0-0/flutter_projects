import 'package:dollar/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  List names = ['kinza', 'areej', 'rabia', 'shaista'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/apple.jpg'),
              ),
              const Text('Visualize the Image'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  optionButton("Apple", context),
                  optionButton("Apple", context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  optionButton("Apple", context),
                  optionButton("Apple", context),
                ],
              ),
            ],
          )),
    );
  }
}
