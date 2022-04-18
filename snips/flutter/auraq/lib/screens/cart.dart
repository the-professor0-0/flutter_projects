import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auraq/screens/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  var id;
  var name;
  var price,qty;
  var image;
  Cart({this.id,this.name,this.price,this.qty,this.image});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController fName = new TextEditingController();
  TextEditingController lName =new TextEditingController();
  TextEditingController phone =new TextEditingController();
  TextEditingController city =new TextEditingController();
  TextEditingController address =new TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<http.Response> createAlbum()async {
    Fluttertoast.showToast(
        msg: "Please Wait...Your order is being Processes",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.lightBlueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
    if (formKey.currentState.validate()) {
      print("Sending");
      var result= await http.post(
        'https://developmenthub.xyz/wp-json/wc/v3/orders?consumer_key=ck_673ea1fe9ec293b5640cf4a3c96dff7eb6f534ea&consumer_secret=cs_7148dbf6e44c761770d61e0fbc54d30a0cd903da',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'payment_method': 'cod',
          'payment_method_title': 'Cash On Delivery',
          'set_paid': false,
          'billing': {
            'first_name': fName.text,
            'last_name': lName.text,
            'address_1': address.text,
            'address_2': '',
            'city': city.text,
            'state': '',
            'postcode': '',
            'country': '',
            'email': 'john.doe@example.com',
            'phone': phone.text,
          },
          'line_items': [
            {'product_id': widget.id, 'quantity': widget.qty , "total":(double.parse(widget.price.toString())*double.parse(widget.qty.toString())).toString()}
          ],
          'shipping': {
            'first_name': fName.text,
            'last_name': lName.text,
            'address_1': address.text,
            'address_2': '',
            'city': city.text,
            'state': '',
            'postcode': '',
            'country': ''
          },
          'shipping_lines': [
            {
              'method_id': 'flat_rate',
              'method_title': 'Flat Rate',
              'total': '0.0'
            }
          ],
        }),
      );
      print(result);
      if(result.toString().toLowerCase()=="instance of 'response'"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Status(statusDetail: "Success",)),
        );
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Status(statusDetail: "Order Failed",)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/logo.png'), width: 100,),
      ),

      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]
            )
        ),
        padding: EdgeInsets.fromLTRB(20,10,20,0),
        child:SingleChildScrollView(
          child: Column(
            children: [
              bookCard2(context,widget.id,widget.name,widget.price,widget.image,widget.qty),
              Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.blue, width: 5),
                color: Colors.white,
              ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Shipping Details", style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  txtField("Enter First Name", fName, "First name Can't Empty", TextInputType.name, Icons.person),
                  txtField("Enter Last Name", lName, "Last name Can't Empty", TextInputType.name, Icons.person),
                  txtField("Enter Phone Number", phone, "Phone Number Can't Empty", TextInputType.number, Icons.contact_phone),
                  txtField("Enter Address ", address, "Address Can't Empty", TextInputType.name, Icons.location_on_outlined),
                  txtField("Enter City Name", city, "City name Can't Empty", TextInputType.name, Icons.location_city_sharp),
                  txtFieldDisabled("Total Bill : "+(double.parse(widget.price.toString())*double.parse(widget.qty.toString())).toString(), TextInputType.name, Icons.attach_money_outlined),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)
                        ),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          createAlbum();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("Place Order",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}



