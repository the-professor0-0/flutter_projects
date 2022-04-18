import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/office_boy_methods.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';

import '../constants.dart';
import 'ob_home_button.dart';

class OfficeHome extends StatefulWidget {
  const OfficeHome({Key? key}) : super(key: key);

  @override
  _OfficeHomeState createState() => _OfficeHomeState();
}

class _OfficeHomeState extends State<OfficeHome> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("BIIT OMS"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mainback.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Current Location',style: TextStyle(fontSize: 18),),
                      const Icon(Icons.arrow_forward),
                      Text(Constant.currentLoc,style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: getLocations(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try {
                      var snap = snapshot.data;
                      Constant.genColors(snap.length);
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {}
                      if (snapshot.hasError) {}
                      return Column(
                        children: [
                          ExpansionTile(
                            title: const Text('Floor A'),
                            children: [
                              ObButton.set(
                                snap,
                                'A',
                                notifyParent: refresh,
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Floor B'),
                            children: [
                              ObButton.set(
                                snap,
                                'B',
                                notifyParent: refresh,
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Floor C'),
                            children: [
                              ObButton.set(
                                snap,
                                'C',
                                notifyParent: refresh,
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Floor D'),
                            children: [
                              ObButton.set(
                                snap,
                                'D',
                                notifyParent: refresh,
                              ),
                            ],
                          ),
                        ],
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
            ),
          ),
        ),
      ),
      drawer: obDrawer(context),
    );
  }
}
