import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/buttons.dart';
import 'package:dollar/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class PaRegister extends StatefulWidget {
  const PaRegister({Key? key}) : super(key: key);

  @override
  _PaRegisterState createState() => _PaRegisterState();
}

class _PaRegisterState extends State<PaRegister> {
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController fnameAt=TextEditingController();
  TextEditingController lnameAt=TextEditingController();
  TextEditingController mob=TextEditingController();
  TextEditingController pwd=TextEditingController();
  TextEditingController cpwd=TextEditingController();
  TextEditingController dob=TextEditingController();

  int radioValue = 1;
  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar3("PA Register"),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/logo.png'),width: 100,),
                registerTextField(fname, "First Name"),
                registerTextField(lname, "Last Name"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    const Text("Gender",style: TextStyle(fontSize: 15),),
                    Radio(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (value){
                          handleRadioValueChange(1);
                        }
                    ),
                    const Text(
                      'Male',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: (value){
                          handleRadioValueChange(2);
                        }
                    ),
                    const  Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                registerTextField(fnameAt, "First Name (Attendant)"),
                registerTextField(lnameAt, "Last Name (Attendant)"),
                registerTextField(mob, "Mobile #"),
                registerTextField(pwd, "Password"),
                registerTextField(cpwd, "Confirm Password"),
                registerTextField(dob, "Date of Birth"),
                registerButton(context),
              ],
            )
        ),
      ),
    );
  }
}
