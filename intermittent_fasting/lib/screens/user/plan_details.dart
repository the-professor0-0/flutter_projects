import 'package:flutter/material.dart';
import 'package:intermittent_fasting/authMethods/ip.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';

class PlanDetails extends StatefulWidget {
  PlanDetails({Key? key}) : super(key: key);
  var id;

  PlanDetails.set(this.id);

  @override
  _PlanDetailsState createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Plan Details"),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: viewPlanDetail(widget.id),
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
                      return Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                  ('http://' +
                                          IP.ip +
                                          '/ifasting/files/' +
                                          snap[index]['b']['img'])
                                      .toString(),
                                ),
                                width: 100,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name : " +
                                        snap[index]['a']['itemName'].toString(),
                                  ),
                                  Text(
                                    "Calories : " +
                                        snap[index]['a']['calories'].toString(),
                                  ),
                                  Text(
                                    snap[index]['a']['dayNo'].toString(),
                                  ),
                                  Text(
                                    "Meal No : "+snap[index]['a']['mealNo'].toString(),
                                  ),
                                  Text(
                                    "Quantity : "+ snap[index]['a']['qty'].toString(),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          const SizedBox(height: 20,),
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
          ],
        ),
      ),
    );
  }
}
