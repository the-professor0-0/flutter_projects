import 'package:auraq/helperMethods/authMethods.dart';
import 'package:auraq/widgets/textFields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Book {
  String name;
  String year;

  Book(this.name, this.year);

  Map toJson() => {
    'bookname': name,
    'year': year,
  };
}

class Profile extends StatefulWidget {
  String token;
  var user;
  Profile(String token,var user){
    this.token=token;
    this.user=user;
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final formKey = GlobalKey<FormState>();
  TextEditingController fnameController=new TextEditingController();
  TextEditingController lnameController=new TextEditingController();
  TextEditingController penController=new TextEditingController();
  TextEditingController cityController=new TextEditingController();
  TextEditingController ageController=new TextEditingController();
  TextEditingController cnicController=new TextEditingController();
  TextEditingController aboutController=new TextEditingController();
  TextEditingController friendController=new TextEditingController();
  TextEditingController bookController=new TextEditingController();
  TextEditingController yearController=new TextEditingController();

  List<Book> book = [];
  String gender="Male";
  var genderGroup = 1;

  String publish="No";
  var publishGroup = 2;

  String selectedFound,selectedSocialMedia;
  List<String> found = <String>['Social Media','Google Media','Friend Referred','Auraq Author Referred','Others'];
  List<String> socialMedia = <String>['Facebook','Twitter','Instagram','Youtube','Other'];
  final List<String> bookName = <String>[''];
  final List<String> bookYear = <String>[''];
  DateTime selectedDate = DateTime.now();
  String date="Date of Birth";

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date=selectedDate.toLocal().toString().split(' ')[0];
      });
  }

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
                            profileTextField("First Name", fnameController,widget.user["data"]["first_name"].toString()),
                            profileTextField("Last Name", lnameController,widget.user["data"]["last_name"].toString()),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Text(date,style: TextStyle(fontSize: 16),) ,
                            ),
                            SizedBox(height: 10,),
                            Container(color: Colors.black,height: 1,),
                            profileTextField("Pen Name", penController,""),
                            profileTextField("City", cityController,""),
                            profileTextField("Age", ageController,""),
                            profileTextField("CNIC/Passport Number", cnicController,""),
                            profileTextField("About", aboutController,""),
                            SizedBox(height: 10,),
                            Text("Previously Published Book : ",style: TextStyle(fontSize: 16),),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: publishGroup,
                                  onChanged: (T) {
                                    setState(() {
                                      publishGroup = T;
                                      publish="Yes";
                                    });
                                  },
                                ),
                                Text("Yes"),
                                Radio(
                                  value: 2,
                                  groupValue: publishGroup,
                                  onChanged: (T) {
                                    setState(() {
                                      publishGroup = T;
                                      publish="No";
                                    });
                                  },
                                ),
                                Text("No"),
                              ],
                            ),
                            SizedBox(height: 10,),
                            publishGroup==1?  Column(
                              children: [
                                profileTextField("Name of book", bookController,""),
                                profileTextField("Year of publication", yearController,""),
                                SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      //books.insert(0, "element");
                                      bookName.insert(0,bookController.text);
                                      bookYear.insert(0, yearController.text);
                                      book.add(Book(bookController.text, yearController.text));
                                    });
                                    print(bookName);
                                    print(bookYear);

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
                                      "Add New",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text("Name"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text("Year"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ):Container(),
                            publishGroup==1? Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 100.0,
                                    child: new ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: bookName.length,
                                      itemBuilder: (BuildContext ctxt, int index) {
                                        return Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              width: 100,
                                              child: Column(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                children: [
                                                  Text(bookName[index]),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                children: [
                                                  Text(bookYear[index]),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ):Container(),
                            Text("Gender : ",style: TextStyle(fontSize: 16),),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: genderGroup,
                                  onChanged: (T) {
                                    setState(() {
                                      gender="Male";
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
                                      gender="Female";
                                      genderGroup = T;
                                    });
                                  },
                                ),
                                Text("Female"),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("How you found Auraq : ",style: TextStyle(fontSize: 16),),
                            SizedBox(height: 10,),
                            Center(
                              child: DropdownButton<String>(
                                hint:  Text("Select Source"),
                                value: selectedFound,
                                onChanged: (String value) {
                                  setState(() {
                                    selectedFound = value;
                                  });
                                },
                                items: found.map((String source) {
                                  return  DropdownMenuItem<String>(
                                    value: source,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text(
                                          source,
                                          style:  TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: 10,),
                            selectedFound=="Auraq Author Referred"?
                            profileTextField("Auraq Friend Name", friendController,""):
                            Container(),
                            selectedFound=="Social Media"?
                            Center(
                              child: DropdownButton<String>(
                                hint:  Text("Select Social Media"),
                                value: selectedSocialMedia,
                                onChanged: (String value) {
                                  setState(() {
                                    selectedSocialMedia = value;
                                  });
                                },
                                items: socialMedia.map((String value) {
                                  return  DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text(
                                          value,
                                          style:  TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ):
                            Container(),
                            GestureDetector(
                              onTap: () {
                                String jsonBook = jsonEncode(book);
                                completeProfile(context,widget.token,widget.user, formKey, fnameController.text, lnameController.text, penController.text, cityController.text, ageController.text, cnicController.text, date, aboutController.text, friendController.text,publish, jsonBook, gender, selectedFound, selectedSocialMedia);
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
