import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2('History'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Appointment Date"),
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Sample 1',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Sample 1',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Sample 1',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 275,
            ),
            const Text("Remarks"),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Row(
                      children:const [
                         Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const Text("1/5"),
                  GestureDetector(
                    child: Row(
                      children:const [
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
