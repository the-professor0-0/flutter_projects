import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/widgets/app_bar.dart';
import 'package:biit_fms/widgets/card.dart';
import 'package:flutter/material.dart';

class CommonTopics extends StatefulWidget {
  CommonTopics({Key? key}) : super(key: key);

  var snap;

  CommonTopics.set(this.snap);

  @override
  _CommonTopicsState createState() => _CommonTopicsState();
}

class _CommonTopicsState extends State<CommonTopics> {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Common Topics',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: getCommon(widget.snap['CourseNo'],widget.snap['COURSE_NO']),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      try {
                        var snap = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {}
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snap.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return snap[index]['taughtby'].toString() ==
                                    Constant.taughtby.toString()
                                ? Text("\u2022 "+snap[index]['title'].toString(),style: TextStyle(fontSize: 16),)
                                : Container();
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
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
