import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:flutter/material.dart';

class CheckBOX extends StatefulWidget {
  CheckBOX({Key? key}) : super(key: key);

  var snap,title,isChecked;
  CheckBOX.set(snap,title,isChecked){
    this.snap=snap;
    this.title=title;
    if(isChecked=='1'){
      this.isChecked=true;
    }
    else{
      this.isChecked=false;
    }
  }
  @override
  _CheckBOXState createState() => _CheckBOXState();
}

class _CheckBOXState extends State<CheckBOX> {

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      autofocus: false,
      activeColor: Constant.blueColor,
      checkColor: Colors.white,
      selected: widget.isChecked,
      value: widget.isChecked,
      onChanged: (bool? value) async{
        setState(() {
          widget.isChecked = value!;
        });
        if(widget.isChecked){
          await addClos(widget.snap['tid'],widget.title);
        }
        else{
          await removeClos(widget.snap['tid'],widget.title);
        }
      },
    );
  }
}
