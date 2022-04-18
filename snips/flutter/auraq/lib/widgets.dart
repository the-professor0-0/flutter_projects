import 'package:auraq/screens/book.dart';
import 'package:auraq/screens/bookDetail.dart';
import 'package:auraq/screens/home.dart';
import 'package:auraq/screens/orderDetail.dart';
import 'package:auraq/screens/user.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


Widget dashboardCard(IconData iconData, String text, String val, Color colors){
  return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: Icon(iconData),
            title: Text(text),
            subtitle: Text(val),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: colors, width: 3),
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
  );
}

Widget dashboardCard2(context,IconData iconData, String text, String val, Color colors){
  return Container(
    height: 300,
    width:(MediaQuery.of(context).size.width-50)/2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
            Icon(iconData),
            SizedBox(height: 10,),
            Text(text, style: TextStyle(fontSize: 16, ),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Container(padding: EdgeInsets.symmetric(horizontal: 10),child: Container(color: Colors.black,height: 2,)),
            SizedBox(height: 10,),
            Text(val, style: TextStyle(fontSize: 16),),
      ],
    ),
    decoration: BoxDecoration(
      border: Border.all(color: colors, width: 3),
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
  );
}

Widget orderCard(context,String orderNo,String bookName,String customerName,String city,String copies,String total,String date,String status){
  Color bgcolor;
  if(status.toLowerCase()=='cancelled'){
    bgcolor=Colors.red[300];
  }
  else if(status.toLowerCase()=='completed') {
    bgcolor=Colors.lightGreen;
  }
  else if(status.toLowerCase()=='failed') {
    bgcolor=Colors.red[700];
  }
  else{
    bgcolor=Colors.blueGrey[700];
  }
  status=status.toUpperCase();
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Row(
        children: [
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width-78,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20,0,0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Order #: $orderNo'),
                                  SizedBox(width:MediaQuery.of(context).size.width-264,),
                                  Text(date),
                                ],
                              ),
                              SizedBox(height: 2,),
                              Container(child: Text(bookName, style: TextStyle(fontSize: 17),),width:MediaQuery.of(context).size.width-100,),
                              Text(customerName, style: TextStyle(fontSize: 13),),
                              Text(city, style: TextStyle(fontSize: 13),),
                            ],
                          ),
                        ],
                      ),
                      Divider(color: Colors.black,thickness: 1,),
                      Row(
                        children: [
                          Text('Copies Ordered : $copies', style: TextStyle(fontSize: 15),),
                          SizedBox(width:MediaQuery.of(context).size.width-298,),
                          Text ('Total : $total'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(0)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            width: 35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(status, style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
  );
}

Widget navigationBar(context,indexNo){
  return CurvedNavigationBar(
          backgroundColor: Colors.blue,
          items: <Widget>[
            Icon(Icons.dashboard_outlined,size: 15,color: Colors.black,),
            Icon(Icons.notes,size: 15,color: Colors.black,),
            Icon(Icons.book_outlined,size: 15,color: Colors.black,),
            Icon(Icons.person_outline_rounded,size: 15,color: Colors.black,),
          ],
          index: indexNo,
          height: 50,
          animationDuration: Duration(milliseconds: 0),
          animationCurve: Curves.bounceInOut,
          onTap: (index){
            if(index == 0){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home(),
                ),
                    (route) => false,
              );
            }
            if(index == 1){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => OrderDetails(),
                ),
                    (route) => false,
              );
            }
            if(index == 2){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Books(),
                ),
                    (route) => false,
              );
            }
            if(index == 3){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => User(),
                ),
                    (route) => false,
              );
            }
          },
  );
}

Widget bookCard(context,int id,String name,String price,String image,String dateTime){
  var date=dateTime.split("T");
  Color colors;
  if(id.isEven){
    colors=Colors.blue;
  }
  else{
    colors=Colors.green;
  }

  return GestureDetector(
    onTap:(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookDetail(product:id.toString()),
      ));
    },
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10 / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Those are our background
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: colors, width: 2.5),
                color:colors
               //boxShadow: [kDefaultShadow],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          // our product image
          Positioned(
            top: 0,
            right: 20,
            child: Hero(
              tag: id,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 140,
                width: 100,
                child: ClipRRect(
                    borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20)
                    ),
                    child: Image.network(image,fit: BoxFit.fill,)
                ),
              ),
            ),
          ),
          // Product title and price
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                        Container(color: Colors.black,height: 1,),
                        SizedBox(height: 10,),
                        Text(
                          date[0].toString(),
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                  // it use the available space
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10 * 1.5, // 30 padding
                      vertical: 10 / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: colors,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Text(
                      "Rs. "+price,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget detailCard(context,int id,String name, String desc,String image,String image2,String price,String publishDate){
  var about= desc.replaceAll("<h4>","").replaceAll("</h4>","").replaceAll("<p>","").replaceAll("</p>","").replaceAll("<h3>","").replaceAll("</h3>","").replaceAll("<br />", "");
  var description=about.split("\n");
  var date=publishDate.split('T');
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: true,
                  reverse: false,
                  enableInfiniteScroll: false,
                ),
                items: [image,image2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        //padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                        child: ClipRRect(
                          borderRadius:  BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(20)
                          ),
                          child:Image.network("$i"),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(name, style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(description[0],textAlign: TextAlign.justify),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Text("Published : "+date[0]),
                          SizedBox(width: 10,),
                          Container(
                                padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent[200],
                                    borderRadius:  BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.monetization_on_outlined,color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text("PKR. "+price, style: TextStyle(color: Colors.white),),
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),


      ],
    ),
  );
}

Widget bookCard2(context,var id,var name,var price,var image,var qty){
  Color colors;
  if(id.isEven){
    colors=Colors.pinkAccent;
  }
  else{
    colors=Colors.green;
  }

  return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10 / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Those are our background
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: colors, width: 2.5),
                color:colors
              //boxShadow: [kDefaultShadow],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          // our product image
          Positioned(
            top: 0,
            right: 20,
            child: Hero(
              tag: id,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 140,
                width: 100,
                child: ClipRRect(
                    borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20)
                    ),
                    child: Image.network(image,fit: BoxFit.fill,)
                ),
              ),
            ),
          ),
          // Product title and price
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  // it use the available space
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10 * 1.5, // 30 padding
                      vertical: 10 / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: colors,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Text(
                      "Rs. "+price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}

Widget txtFieldDisabled(txt, type, icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: TextFormField(
      enabled: false,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: txt,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.black,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
    ),

  );
}

Widget txtField(txt, controller, error, type, icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: TextFormField(
        controller: controller,
        decoration: new InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: txt,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          fillColor: Colors.black,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
        ),
        validator: (val) {
          if (val.length == 0) {
            return error;
          } else {
            return null;
          }
        },
        keyboardType: type,
      ),

  );
}














