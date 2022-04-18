import 'package:auraq_publications/screens/home.dart';
import 'package:auraq_publications/widgets/textFields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final formKey = GlobalKey<FormState>();
  TextEditingController fnameContoller=new TextEditingController();
  TextEditingController lnameContoller=new TextEditingController();
  TextEditingController penContoller=new TextEditingController();
  TextEditingController cityContoller=new TextEditingController();
  TextEditingController ageContoller=new TextEditingController();
  TextEditingController cnicContoller=new TextEditingController();
  TextEditingController dobContoller=new TextEditingController();
  TextEditingController aboutController=new TextEditingController();
  TextEditingController newContoller=new TextEditingController();

  var genderGroup = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/register.jpg'),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Image(
                              image: AssetImage('assets/logo_black.png'),
                              width: 200,
                            ),
                            SizedBox(height: 10,),
                            loginTextField("First Name", fnameContoller),
                            loginTextField("Last Name", lnameContoller),
                            loginTextField("Pen Name", penContoller),
                            loginTextField("City", cityContoller),
                            loginTextField("Age", ageContoller),
                            loginTextField("CNIC/Passport Number", cnicContoller),
                            loginTextField("DOB", dobContoller),
                            loginTextField("About", aboutController),
                            loginTextField("New or previously published", newContoller),
                            SizedBox(height: 10,),
                            Text("Gender : ",style: TextStyle(fontSize: 16),),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: genderGroup,
                                  onChanged: (T) {
                                    setState(() {
                                      genderGroup = T;
                                    });
                                  },
                                ),
                                Text("Male"),
                                Radio(
                                  value: 2,
                                  groupValue: genderGroup,
                                  onChanged: (T) {
                                    setState(() {
                                      genderGroup = T;
                                    });
                                  },
                                ),
                                Text("Female"),
                              ],
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => Home()
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue
                                ),
                                child: Text(
                                  "Complete Profile",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
