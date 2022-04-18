import 'package:auraq/helperMethods/getMethods.dart';
import 'package:auraq/screens/authentication/profile.dart';
import 'package:auraq/screens/mainScreens/uploadBook.dart';
import 'package:auraq/widgets/cards.dart';
import 'package:auraq/widgets/drawerNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  var token,user;
  Home.set(bearer,userData){
    token=bearer;
    user=userData;
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

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

  var dataUser;
  var pageNo=1;

  completeProfile(String token,var user){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile(token,user)),
    );
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
              body: DrawerData(widget.token,widget.user),
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
                            colors: [Color(0xff161d30),Color(0xff161d30)]
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
                      future: getBooks(widget.token),
                      builder: (BuildContext context,AsyncSnapshot snapshot) {
                        var snap = snapshot.data;
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                              child:SpinKitFadingCube(
                                color: Colors.white,
                                size: 30.0,
                              )
                          );
                        }
                        if(snapshot.hasError) {
                          print("Error...Can't connect to server");
                        }
                        try{
                          if(snap["data"].length==0){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.book_outlined,size: 50,color: Colors.white,),
                                SizedBox(height: 20,),
                                Text(
                                  "You don't have any Books yet",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                FlatButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context) => UploadBook.set(widget.token,widget.user)
                                    ));
                                  },
                                  child: Text(
                                    "Upload Book",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                          return ListView.builder(
                              itemCount: snap["data"].length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context,index) {
                                return bookCard(context,widget.token,snap["data"][index],widget.user);
                              }
                          );
                        }catch(Exception){
                          if(snap["message"]=="Please Complete Profile to Proceed your Dashboard"){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.warning_amber_outlined,size: 50,color: Colors.white,),
                                SizedBox(height: 10,),
                                Text(
                                  "Please Complete Profile to Proceed your Dashboard",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10,),
                                FlatButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    print(widget.user);
                                    completeProfile(widget.token,widget.user);
                                  },
                                  child: Text(
                                    "Complete Profile",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                          if(snap["message"]=="Please Verify Your Account First"){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.warning_amber_outlined,size: 50,color: Colors.white,),
                                SizedBox(height: 20,),
                                Text(
                                  "Please Verify Your Account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "We have sent you a verification link on you Email address",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                              ],
                            );
                          }
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
              ),
            )
          ],
        );
      },
    );
  }
}
