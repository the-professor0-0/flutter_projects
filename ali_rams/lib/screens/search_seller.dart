import 'package:ali_rams/widgets/app_bar.dart';
import 'package:ali_rams/widgets/bottom_nav.dart';
import 'package:ali_rams/widgets/card.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:flutter/material.dart';

class Seller extends StatefulWidget {
  const Seller({Key? key}) : super(key: key);

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {

  String chosenValue="Rawalpindi";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Find Nearby Seller",style: TextStyle(fontSize: 20),),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Constant.blueColor)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      child: DropdownButton<String>(
                        focusColor:Colors.white,
                        value: chosenValue,
                        style:const TextStyle(color: Colors.white),
                        iconEnabledColor:Colors.black,
                        items: <String>[
                          'Rawalpindi',
                          'Islamabad',
                          'Karachi',
                          'Multan',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style:const TextStyle(color:Colors.black),),
                          );
                        }).toList(),
                        hint:const Text(
                          "Please choose a City",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            chosenValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                sellerLocation(1,"6th-Road | Rawalpindi", context),
                sellerLocation(2,"Tench Bhatta | Rawalpindi", context),
                sellerLocation(3,"Misryal | Rawalpindi", context),
                sellerLocation(4,"Shamsabad | Rawalpindi", context),
                sellerLocation(1,"Double Road | Rawalpindi", context),
                sellerLocation(2,"Waris Khan | Rawalpindi", context),
                sellerLocation(3,"Saddar | Rawalpindi", context),
                sellerLocation(4,"Bank Road | Rawalpindi", context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(context, 2),
    );
  }
}
