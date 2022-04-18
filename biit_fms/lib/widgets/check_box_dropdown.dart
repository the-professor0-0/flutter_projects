import 'package:biit_fms/constants/constants.dart';
import 'package:flutter/material.dart';

class CheckBoxDropDown extends StatefulWidget {
  CheckBoxDropDown({Key? key}) : super(key: key);

  var isChecked, title, chosenValue;

  CheckBoxDropDown.set(this.isChecked, this.title, this.chosenValue);

  @override
  _CheckBoxDropDownState createState() => _CheckBoxDropDownState();
}

class _CheckBoxDropDownState extends State<CheckBoxDropDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.isChecked,
              onChanged: (value) {
                setState(() {
                  widget.isChecked = value!;
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
    );
  }
}
