import 'package:auraq_publications/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'shipping.dart';

// ignore: must_be_immutable
class PlaceOrder extends StatefulWidget {
  var id="";
  var name,desc,price,image,image2;
  PlaceOrder({this.id,this.name,this.desc,this.image,this.image2,this.price});
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  var qty=1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            detailCard(context,int.tryParse(widget.id),widget.name,widget.desc,widget.image,widget.image2,widget.price),
            Center(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: 200,
                    child: Row(
                      children: [
                        Text('Quantity'),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if(qty!=1){
                                qty--;
                              }
                            });
                          },
                        ),
                        Text(qty.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              qty++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Text("Published : "+date[0]),
                      SizedBox(width: 10,),
                      Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)
                            ),),
                          child: Text("PKR. "+widget.price, style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)
                ),
                color: Colors.blue[900],
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Shipping(id:widget.id,name:widget.name,price:widget.price,qty:qty,image:widget.image)),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                    SizedBox(width: 5,),
                    Text("Order Now",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}

