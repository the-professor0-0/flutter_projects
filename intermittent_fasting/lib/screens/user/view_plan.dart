import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';
import 'package:intermittent_fasting/screens/user/plan_details.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';

class ViewPlan extends StatefulWidget {
  const ViewPlan({Key? key}) : super(key: key);

  @override
  _ViewPlanState createState() => _ViewPlanState();
}

class _ViewPlanState extends State<ViewPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("View Plan"),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
        child: Column(
          children: [
            const Text(
              "Plans",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: viewPlans(),
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
                      return GestureDetector(
                        onTap: () {
                          Get.to(PlanDetails.set(snap[index]['id']));
                        },
                        onLongPress: () async {
                          snap[index]['status'].toString() == '1'
                              ? await deactivatePlan(
                                  snap[index]['id'].toString())
                              : await activatePlan(
                                  snap[index]['id'].toString());
                          setState(() {});
                        },
                        child: Container(
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snap[index]['planname'].toString(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(
                                          PlanDetails.set(snap[index]['id']));
                                    },
                                    child: const Text('Details'),
                                  )
                                ],
                              ),
                              snap[index]['status'].toString() == '1'
                                  ? const Text("Activated",
                                      style: TextStyle(color: Colors.green))
                                  : const Text("Dectivated",
                                      style: TextStyle(color: Colors.red)),
                            ],
                          ),
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
      drawer: userDrawer(context),
    );
  }
}
