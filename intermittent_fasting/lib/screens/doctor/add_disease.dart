import 'package:flutter/material.dart';
import 'package:intermittent_fasting/authMethods/doctor_methods.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';
import '../../widgets/appbar.dart';

class AddDisease extends StatefulWidget {
  const AddDisease({Key? key}) : super(key: key);

  @override
  _AddDiseaseState createState() => _AddDiseaseState();
}

class _AddDiseaseState extends State<AddDisease> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Add Disease"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            textField("Disease Name", name, context, false),
            ElevatedButton(
              onPressed: () {
                addDisease(name.text);
              },
              child: const Text("Add Disease"),
            )
          ],
        ),
      ),
      drawer: doctorDrawer(context),
    );
  }
}
