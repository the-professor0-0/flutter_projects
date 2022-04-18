import 'dart:async';
import 'package:auraq_publications/screens/book/invoice.dart';
import 'package:auraq_publications/screens/book/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget bottomNavigation(context,int selectedIndex,var id,var name,var desc,var image,var image2,var price){
  return Container(
    color: Colors.white,
    child: SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: GNav(
            backgroundColor: Colors.white,
            gap: 3,
            activeColor: Colors.white,
            iconSize: 18,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabBackgroundColor: Colors.blue,
            tabMargin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            tabs: [
              GButton(
                icon: Icons.monetization_on_outlined,
                text: 'Invoice',
              ),
              GButton(
                icon: Icons.question_answer_outlined,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.add_shopping_cart,
                text: 'Cart',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              Timer(Duration(milliseconds: 300), () {
                switch (index) {
                  case 0:
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => Invoice.setData(id:id.toString(),name:name,desc: desc,image: image,image2: image2,price: price)
                    ));
                    break;
                  case 1:

                    break;
                  case 2:
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>  Cart.setData(id:id.toString(),name:name,desc: desc,image: image,image2: image2,price: price)
                    ));
                    break;
                }
              });
            }),
      ),
    ),
  );
}



