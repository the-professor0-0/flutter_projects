import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  var result;
  Test(var res){
    result=res;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(result.toString()),
    );
  }
}
