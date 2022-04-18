import 'package:flutter/material.dart';
import '../widgets.dart';
import 'package:auraq/screens/cart.dart';

class PlaceOrder extends StatefulWidget {
  var responseBody;
  PlaceOrder({this.responseBody});
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
            detailCard(context,widget.responseBody['id'],widget.responseBody['name'],widget.responseBody['short_description'],widget.responseBody['images'][0]['src'],widget.responseBody['price'],widget.responseBody['date_created']),
            Center(
              child: Container(
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
                height: 70,
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
                    MaterialPageRoute(builder: (context) => Cart(id:widget.responseBody['id'],name:widget.responseBody['name'],price:widget.responseBody['price'],qty:qty,image:widget.responseBody['images'][0]['src'])),
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

