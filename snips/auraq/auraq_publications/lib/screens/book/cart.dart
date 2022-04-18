import 'package:auraq_publications/screens/book/placeOrder.dart';
import 'package:auraq_publications/widgets/bottomNavigation.dart';
import 'package:auraq_publications/widgets/drawerData.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  var id="";
  var name,desc,price,image,image2;
  Cart.setData({this.id,this.name,this.desc,this.image,this.image2,this.price});

  Cart({Key key}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {

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
                          Image(image: AssetImage("assets/logo.png"),width: 100,)
                        ],
                      ),
                    ),
                  ),
                ),
                body:  Container(
                  width:  MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/mainBackground.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20,10,20,0),
                  child: PlaceOrder(id:widget.id,name:widget.name,desc:widget.desc,image:widget.image,image2:widget.image2,price:widget.price)
                ),
                bottomNavigationBar: bottomNavigation(context,2,widget.id,widget.name,widget.desc,widget.image,widget.image2,widget.price),
              ),
            )
          ],
        );
      },
    );
  }
}
