import 'package:flutter/material.dart';


class HODCheckBox extends StatefulWidget {
  HODCheckBox({Key? key}) : super(key: key);
  var isChecked, title, snap, aid;

  HODCheckBox.set(
      this.isChecked, this.title, this.snap, this.aid);

  @override
  _HODCheckBoxState createState() => _HODCheckBoxState();
}

class _HODCheckBoxState extends State<HODCheckBox> {
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
                onChanged: (bool? value) {

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

        ],
      ),
    );
  }
}
