import 'package:auraq_publications/authentication/login.dart';
import 'package:auraq_publications/screens/book/bookUpload.dart';
import 'package:auraq_publications/screens/home.dart';
import 'package:auraq_publications/screens/orderDetails.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class DrawerData extends StatefulWidget {
  const DrawerData();

  @override
  _DrawerDataState createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  // bool isLoggedInFacebook = false;
  //
  // Map userProfile;
  //
  // final facebookLogin = FacebookLogin();
  //
  // logout(){
  //   facebookLogin.logOut();
  //   setState(() {
  //     isLoggedInFacebook = false;
  //   });
  // }

  navigate(context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BookUpload()));
    }
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OrderDetails()));
    }
    if (index == 3) {
      //logout();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawer = [
      DrawerItem('Home', Icons.home),
      DrawerItem('Upload Book', Icons.book_outlined),
      DrawerItem('Order Details', Icons.reorder),
      DrawerItem('Sign Out', Icons.exit_to_app),
    ];
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/drawerBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DashBoard',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const Divider(
                color: Colors.white54,
              ),
              ListView.builder(
                  itemCount: drawer.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12, left: 12),
                      child: InkWell(
                        onTap: () {
                          navigate(context, index);
                        },
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  drawer[index].icon,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  drawer[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem {
  final String name;
  final IconData icon;

  const DrawerItem(this.name, this.icon);
}
