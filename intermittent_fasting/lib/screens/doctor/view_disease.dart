import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authMethods/doctor_methods.dart';
import 'package:intermittent_fasting/screens/doctor/add_disease.dart';
import 'package:intermittent_fasting/screens/doctor/restrict_ingredients.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';
import '../../authScreens/login.dart';

class ViewDisease extends StatefulWidget {
  const ViewDisease({Key? key}) : super(key: key);

  @override
  _ViewDiseaseState createState() => _ViewDiseaseState();
}

class _ViewDiseaseState extends State<ViewDisease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("View Disease"),
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
              future: viewDisease(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var snap = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {}
                try {
                  return ListView.builder(
                    itemCount: snap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snap[index]['name'].toString(),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(RestrictIngredients.set(snap[index]));
                              },
                              child: const Text('Restrict Ingredients'),
                            )
                          ],
                        ),
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
      drawer: doctorDrawer(context),
    );
  }
}
