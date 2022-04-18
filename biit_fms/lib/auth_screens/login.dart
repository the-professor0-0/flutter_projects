import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/buttons.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController empno = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //naseer CC empno.text='BIIT205';
    //umer TM empno.text='BIIT235';
    //hod empno.text='BIIT179';
    //azhar VP empno.text='BIIT218';
    //Zahid MPL empno.text='BIIT233';
    empno.text='BIIT235';
    pass.text='1';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constant.blueColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image:  AssetImage('assets/logo.png'),width: 150,),
                const Text("BIIT Folder Management System",style: TextStyle(fontSize: 18),),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                loginTextfield("Name", empno, Icons.person, context,false),
                loginTextfield("Password", pass, Icons.vpn_key, context,true),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Constant.orangeColor),
                  ),
                ),
                loginButton("LOGIN",empno.text,pass.text, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
