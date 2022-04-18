import 'package:flutter/material.dart';
import 'package:intermittent_fasting/authMethods/ip.dart';
import 'package:intermittent_fasting/authMethods/user_methods.dart';

import '../constant.dart';

class ItemCard extends StatefulWidget {
  ItemCard({Key? key}) : super(key: key);

  var snap, isChecked, qty, dpVal, mealno, planId;

  ItemCard.set(this.snap, this.isChecked, this.qty, this.dpVal, this.mealno,
      this.planId);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image(
                    image: NetworkImage(
                      ('http://' +
                              IP.ip +
                              '/ifasting/files/' +
                              widget.snap['img'])
                          .toString(),
                    ),
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : " +
                          widget.snap['itemname'].toUpperCase().toString()),
                      widget.dpVal == 'Fruits'
                          ? const Text("UNIT : 1Piece")
                          : const Text("Unit: 1 Plate"),
                      Text("Calories : " +
                          widget.snap['calories'].toUpperCase().toString())
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  showAlertIngredient(widget.snap['c'], context);
                },
                child: const Text("ViewIngredients"),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                child: TextFormField(
                  controller: widget.qty,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 30,
                child: Checkbox(
                  value: widget.isChecked,
                  onChanged: (value) {
                    widget.isChecked = value!;
                    setState(() {});
                    if (value) {
                      int n = (int.tryParse(widget.qty.text)! *
                          int.tryParse(widget.snap['calories'])!);
                      if (checkCalories(n) ||
                          checkAmount(widget.snap['c'], int.tryParse(widget.qty.text))
                      ) {
                        widget.isChecked = false;
                        setState(() {});
                      } else {
                        Constants.consumed.text =
                            (int.tryParse(Constants.consumed.text)! + n)
                                .toString();
                        addDiet(
                            widget.planId,
                            widget.snap['itemname'],
                            widget.snap['calories'],
                            widget.dpVal,
                            widget.qty.text,
                            widget.mealno);
                      }
                    } else {
                      int n = (int.tryParse(widget.qty.text)! *
                          int.tryParse(widget.snap['calories'])!);
                      Constants.consumed.text =
                          (int.tryParse(Constants.consumed.text)! - n)
                              .toString();
                      removeDiet(
                          widget.planId,
                          widget.snap['itemname'],
                          widget.snap['calories'],
                          widget.dpVal,
                          widget.qty.text,
                          widget.mealno);
                      if (int.parse(Constants.consumed.text) < 0) {
                        Constants.consumed.text = '0';
                      }
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  checkCalories(n) {
    if ((int.tryParse(Constants.consumed.text)! + n) >
        int.tryParse(Constants.calories.text)!) {
      showAlertCalories(context);
      return true;
    }
    return false;
  }

  checkAmount(snap, qty) {
    int ind = 0;
    int check = 0;
    for (int i = 0; i < snap.length; i++) {
      int index = User.ingName.indexWhere((element) =>
          element.toString().toLowerCase() ==
          snap[i]['IngName'].toString().toLowerCase());
      var qtyUser = int.parse(User.qty[index].toString()).toString();
      var qtyDb =
          (int.parse(qty.toString()) * int.parse(snap[i]['IngQty'].toString()))
              .toString();
      if (int.parse(qtyUser) < int.parse(qtyDb)) {
        check = 1;
        ind = index;
      }
    }
    if (check == 0) {
      return false;
    } else {
      showIngredientCalories(context, User.ingName[ind].toString(), User.qty[ind].toString());
    }
    return true;
  }

  showAlertCalories(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      content: Text("You have exceeded the Calories limits"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showIngredientCalories(BuildContext context,name,qty) {
    AlertDialog alert = AlertDialog(
      content: Text('You have exceeded the '+name+' Intake limits \nMax Intake Allowed : '+qty),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertIngredient(snap, BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: SizedBox(
          width: 100,
          height: 100,
          child: ListView.builder(
            itemCount: snap.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(snap[index]['IngName'].toString()),
                  Row(
                    children: [
                      Text(snap[index]['IngQty'].toString()),
                      Text(snap[index]['IngUnit'].toString()),
                    ],
                  ),
                ],
              );
            },
          )),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
