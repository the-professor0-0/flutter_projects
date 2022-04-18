import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/admin_methods.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';
import 'package:flutter_audio_record/widgets/text_fields.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

  var floor = 'Select Floor';
  List<String> floorList = [];

  genFloorDropDown(snap) {
    floorList.clear();
    floorList.add('Select Floor');
    for (int i = 0; i < snap.length; i++) {
      floorList.add(snap[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Add Location"),
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
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                textfield("Floor Name", fname, Icons.map, context),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    addFloor(fname.text.toUpperCase());
                  },
                  child: const Text("Add Floor"),
                ),
                const SizedBox(height: 10),
                textfield("Location Name", lname, Icons.location_city_outlined,
                    context),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Floor : ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder(
                      future: getFloors(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        try {
                          var snap = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {}
                          genFloorDropDown(snap);
                          return DropdownButton<String>(
                            value: floor,
                            items: floorList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                floor = val!;
                              });
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
                const SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    addLocation(lname.text, floor.toUpperCase());
                  },
                  child: const Text("Add Location"),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: adminDrawer(context),
    );
  }
}
