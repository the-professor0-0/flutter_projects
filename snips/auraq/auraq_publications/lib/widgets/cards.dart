import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          height: 150,
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
          height: 150,
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

// Widget bookCard(context,int id,String name,var desc,String image,String image2,String price){
//   Color colors;
//   if(id.isEven){
//     colors=Colors.blue;
//   }
//   else{
//     colors=Colors.green;
//   }
//   return GestureDetector(
//     onTap:(){
//       Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Invoice.setData(id:id.toString(),name:name,desc: desc,image: image,image2: image2,price: price),
//           ));
//     },
//     child: Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 10 / 2,
//       ),
//       // color: Colors.blueAccent,
//       height: 160,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: <Widget>[
//           // Those are our background
//           Container(
//             height: 136,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(22),
//                 border: Border.all(color: colors, width: 2.5),
//                 color:colors
//               //boxShadow: [kDefaultShadow],
//             ),
//             child: Container(
//               margin: EdgeInsets.only(right: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(22),
//               ),
//             ),
//           ),
//           // our product image
//           Positioned(
//             top: 0,
//             right: 20,
//             child: Hero(
//               tag: id,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 height: 140,
//                 width: 100,
//                 child: ClipRRect(
//                     borderRadius:  BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(0),
//                         bottomLeft: Radius.circular(0),
//                         bottomRight: Radius.circular(20)
//                     ),
//                     child: Image.network(image,fit: BoxFit.fill,)
//                 ),
//               ),
//             ),
//           ),
//           // Product title and price
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: SizedBox(
//               height: 136,
//               width: MediaQuery.of(context).size.width - 100,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Spacer(),
//                   Container(
//                     width: 200,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         SizedBox(height: 10,),
//                         Container(color: Colors.black,height: 1,),
//                         SizedBox(height: 10,),
//                       ],
//                     ),
//                   ),
//                   // it use the available space
//                   Spacer(),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10 * 1.5, // 30 padding
//                       vertical: 10 / 4, // 5 top and bottom
//                     ),
//                     decoration: BoxDecoration(
//                       color: colors,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(22),
//                         topRight: Radius.circular(22),
//                       ),
//                     ),
//                     child: Text(
//                       "Rs. "+price,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }


Widget bookCard(context,int id,String name,var desc,String language,String pages){
  Color colors;
  if(id.isEven){
    colors=Colors.blue;
  }
  else{
    colors=Colors.green;
  }
  return GestureDetector(
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
                    //child: Image.network(image,fit: BoxFit.fill,)
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
                          "No of Pages : "+pages,
                          style: TextStyle(fontSize: 12),
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
                      language,
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



Widget bookCard2(context,var id,var name,var price,var image,var qty){

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
              border: Border.all(color: Colors.green, width: 2.5),
              color:Colors.green
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
                    color: Colors.green,
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

Widget detailCard(context,int id,String name, String desc,String image,String image2,String price){
  var about= desc.replaceAll("<h4>","").replaceAll("</h4>","").replaceAll("<p>","").replaceAll("</p>","").replaceAll("<h3>","").replaceAll("</h3>","").replaceAll("<br />", "");
  var description=about.split("\n");
  //var date=publishDate.split('T');
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
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


