import 'package:auraq_publications/screens/search.dart';
import 'package:auraq_publications/widgets/cards.dart';
import 'package:auraq_publications/widgets/drawerData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../helperMethods/getMethods.dart';


class OrderDetails extends StatefulWidget {
  const OrderDetails({Key key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

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

  var date;

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
                            colors: [Color(0xff311e70),Color(0xff32397f)]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
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
                          Image(image: AssetImage("assets/logo.png"),width: 100,)
                        ],
                      ),
                    ),
                  ),
                ),
                body: Container(
                  width:  MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/mainBackground.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20,10,20,0),
                  child: FutureBuilder(
                      future: getOrders(),
                      builder: (BuildContext context,AsyncSnapshot snapshot) {
                        List snap = snapshot.data;
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                              child:SpinKitChasingDots(
                                color: Colors.white,
                                size: 50.0,
                              )
                          );
                        }
                        if(snapshot.hasError){
                          print("Error...Can't connect to server");
                        }
                        try{
                          return ListView.builder(
                            itemCount: snap.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              date=snap[index]['date_created'].split('T');
                              return orderCard(
                                  context,
                                  snap[index]['id'].toString(),
                                  snap[index]['line_items'][0]['name'].toString(),
                                  snap[index]['billing']['first_name'].toString()+" "+snap[index]['billing']['last_name'].toString(),
                                  snap[index]['shipping']['city'].toString(),
                                  snap[index]['line_items'][0]['quantity'].toString(),
                                  snap[index]['total'].toString(),
                                  date[0],
                                  snap[index]['status'].toString()
                              );
                            },
                          );
                        }catch(Exception){
                          return Center(
                            child: Text(
                              "Connection Error...\nPlease check your Internet connection...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          );
                        }

                      }
                  ),
                ),
                floatingActionButton: FloatingActionButton(

                  child: Icon(Icons.search),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Search()),
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
