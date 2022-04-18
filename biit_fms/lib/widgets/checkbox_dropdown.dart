import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:flutter/material.dart';

class CheckBoxDropDown extends StatefulWidget {
  CheckBoxDropDown({Key? key}) : super(key: key);

  var stid,isChecked, title, chosenValue, snap, aid;

  CheckBoxDropDown.set(this.stid,
      this.isChecked, this.title, this.chosenValue, this.snap, this.aid);

  @override
  _CheckBoxDropDownState createState() => _CheckBoxDropDownState();
}

class _CheckBoxDropDownState extends State<CheckBoxDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: widget.isChecked,
                onChanged: (bool? value) async {
                  if (value!) {
                    await addCovered(
                        widget.snap['id'], widget.chosenValue, widget.aid);
                    setState(() {});
                  } else {
                    await removeCovered(widget.aid,widget.stid);
                    setState(() {});
                  }
                  setState(() {
                    widget.isChecked = value;
                  });
                },
              ),
              SizedBox(
                width: 200,
                child: Text(
                  widget.title.toString(),
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            value: widget.chosenValue,
            iconEnabledColor: Colors.black,
            items: Week.weeks.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                widget.chosenValue = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
