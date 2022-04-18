import 'package:auraq_publications/screens/book/invoiceUpload.dart';
import 'package:auraq_publications/widgets/bottomNavigation.dart';
import 'package:auraq_publications/widgets/drawerData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Invoice extends StatefulWidget {
  var id="";
  var name,desc,price,image,image2;
  Invoice.setData({this.id,this.name,this.desc,this.image,this.image2,this.price});

  Invoice({Key key}) : super(key: key);
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> with SingleTickerProviderStateMixin  {

  AnimationController _animationController;

  final formKey = GlobalKey<FormState>();
  TextEditingController copyController = new TextEditingController();

  bool coverDesign = false;
  bool binding = false;
  bool lamination = false;
  bool color = false;

  int total=0;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xff22a6b3),
              body: const DrawerData(),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xff311e70), Color(0xff32397f)])),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => _toggleAnimation(),
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: _animationController,
                              color: Colors.white,
                            ),
                          ),
                          Image(
                            image: AssetImage("assets/logo.png"),
                            width: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/mainBackground.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Form(
                            key: formKey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: TextFormField(
                                      onChanged: (String value){
                                        total=int.tryParse(value)*100;
                                      },
                                      controller: copyController,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        color:  Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 3),
                                        labelText: "No. of Copies",
                                        labelStyle: TextStyle(color:  Colors.black,),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color:  Colors.black,),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                        keyboardType: TextInputType.number
                                    ),
                                  ),
                                  Text("Services",style: TextStyle(fontSize: 20),),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        value: this.coverDesign,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.coverDesign = value;
                                            if(value==true){
                                              total+=100;
                                            }
                                            else{
                                              total-=100;
                                            }
                                          });
                                        },
                                      ),
                                      Text ("Cover Design",style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        value: this.binding,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.binding = value;
                                            if(value==true){
                                              total+=100;
                                            }
                                            else{
                                              total-=100;
                                            }
                                          });
                                        },
                                      ),
                                      Text ("Binding",style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        value: this.lamination,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.lamination = value;
                                            if(value==true){
                                              total+=100;
                                            }
                                            else{
                                              total-=100;
                                            }
                                          });
                                        },
                                      ),
                                      Text ("Lamination",style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        value: this.color,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.color = value;
                                            if(value==true){
                                              total+=100;
                                            }
                                            else{
                                              total-=100;
                                            }
                                          });
                                        },
                                      ),
                                      Text ("Color Copy",style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                  Divider(color: Colors.black,),
                                  Text("Total : " + total.toString()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Colors.blue),
                                      child: Text(
                                        "Download Invoice",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => InvoiceUpload()),
                                        );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Colors.green),
                                      child: Text(
                                        "Upload Invoice",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: bottomNavigation(context,0,widget.id,widget.name,widget.desc,widget.image,widget.image2,widget.price,),

              ),
            )
          ],
        );
      },
    );
  }
}
