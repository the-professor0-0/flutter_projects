import 'package:flutter/material.dart';
import 'package:intermittent_fasting/authMethods/doctor_methods.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';

class RestrictIngredients extends StatefulWidget {
  RestrictIngredients({Key? key}) : super(key: key);

  var snap;

  RestrictIngredients.set(this.snap);

  @override
  _RestrictIngredientsState createState() => _RestrictIngredientsState();
}

class _RestrictIngredientsState extends State<RestrictIngredients> {
  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController unit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Restrict Ingredients"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            textField("Ingredient Name", name, context, false),
            textField("Ingredient Quantity", qty, context, false),
            textField("Unit", unit, context, false),
            ElevatedButton(
              onPressed: () async {
                await restrictIngredient(
                  widget.snap['id'],
                  name.text,
                  qty.text,
                  unit.text
                );
                setState(() {});
              },
              child: const Text("Restrict Ingredient"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'name'.toUpperCase(),
                    style:const  TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                  ),
                  Text(
                    'quantity'.toUpperCase(),
                    style:const  TextStyle(
                        color: Colors.blue,
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            FutureBuilder(
              future: viewRestrictedIngredients(widget.snap['id']),
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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snap[index]['ingName'].toString().toUpperCase(),
                              style:const  TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      snap[index]['qty'].toString()+" ",
                                      style:const  TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16
                                      ),
                                    ),
                                    Text(
                                      snap[index]['unit'].toString(),
                                      style:const  TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
    );
  }
}
