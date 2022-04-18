import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/widgets/check_boxes.dart';
import 'package:flutter/material.dart';

class CLOS extends StatefulWidget {
  CLOS({Key? key}) : super(key: key);

  var snap;

  CLOS.set(snap) {
    this.snap = snap;
  }

  @override
  _CLOSState createState() => _CLOSState();
}

class _CLOSState extends State<CLOS> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: formkey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: getTopics(widget.snap['COURSE_NO']),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      var snap = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        print("ERROR");
                      }
                      try {
                        return ListView.builder(
                          itemCount: snap.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: Text(snap[index]['name'].toString()),
                              children: [
                                CheckBOX.set(snap[index], 'CLO1', snap[index]['clo1'],),
                                CheckBOX.set(snap[index], 'CLO2', snap[index]['clo2'],),
                                CheckBOX.set(snap[index], 'CLO3', snap[index]['clo3'],),
                                CheckBOX.set(snap[index], 'CLO4', snap[index]['clo4'],),
                                CheckBOX.set(snap[index], 'CLO5', snap[index]['clo5'],),
                                CheckBOX.set(snap[index], 'CLO6', snap[index]['clo6'],),
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
      ),
    );
  }
}
