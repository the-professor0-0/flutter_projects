import 'package:flutter/material.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';
import 'package:intermittent_fasting/constant.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';

class SetDisease extends StatefulWidget {
  const SetDisease({Key? key}) : super(key: key);

  @override
  _SetDiseaseState createState() => _SetDiseaseState();
}

class _SetDiseaseState extends State<SetDisease> {
  List<bool> checkBool = [];

  genBool(snap) {
    for (int i = 0; i < snap.length; i++) {
      checkBool.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Set Disease"),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
        child: Column(
          children: [
            const Text(
              "Diseases",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: viewUserDisease(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                try {
                  var snap = snapshot.data;
                  genBool(snap);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {}
                  return ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(
                          snap[index]['name'].toString().toUpperCase(),
                        ),
                        controlAffinity: ListTileControlAffinity.platform,
                        value: snap[index]['userid'].toString()==User.id.toString()?true:false,
                        onChanged: (bool? value) async {
                          if (value == true) {
                            await userAddDisease(snap[index]['id']);
                            setState(() {

                            });
                          } else {
                            await userRemoveDisease(snap[index]['id']);
                            setState(() {
                              checkBool[index] = value!;
                            });
                          }
                        },
                        activeColor: Colors.blue,
                        checkColor: Colors.black,
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
          ],
        ),
      ),
      drawer: userDrawer(context),
    );
  }
}
