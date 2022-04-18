import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';
import 'package:intermittent_fasting/screens/user/view_plan.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';

class AddIngredient extends StatefulWidget {
  AddIngredient({Key? key}) : super(key: key);

  var itemId;

  AddIngredient.set(this.itemId);

  @override
  _AddIngredientState createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  List ingName = [];
  List ingQty = [];
  List ingUnit = [];

  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController unit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Add Ingredients'),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              textField("Ingredient Name", name, context, false),
              const SizedBox(
                height: 10,
              ),
              textField("Quantity", qty, context, false),
              const SizedBox(
                height: 10,
              ),
              textField("Unit", unit, context, false),
              const SizedBox(
                height: 10,
              ),
              ingName.isNotEmpty
                  ? SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: ingName.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ingName[index],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ingQty[index],
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                    Text(
                                      ingUnit[index],
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
              ElevatedButton(
                onPressed: () {
                  ingName.add(name.text);
                  ingQty.add(qty.text);
                  ingUnit.add(unit.text);
                  addIngredients(widget.itemId, name.text, qty.text, unit.text);
                  name.text='';
                  qty.text='';
                  unit.text='';
                  setState(() {});
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(const ViewPlan());
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
