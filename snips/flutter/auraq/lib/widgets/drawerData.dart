import 'package:auraq/screens/authentication/login.dart';
import 'package:auraq/screens/mainScreens/home.dart';
import 'package:flutter/material.dart';
import 'package:auraq/screens/mainScreens/uploadBook.dart';
// ignore: must_be_immutable
class DrawerData extends StatefulWidget {
  String token;
  var user;
  DrawerData(bearer,userData){
   token=bearer;
   user=userData;
  }

  @override
  _DrawerDataState createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  navigate(context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home.set(widget.token,widget.user)));
    }
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UploadBook.set(widget.token,widget.user)));
    }
    // if (index == 2) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => OrderDetails.set(widget.token,widget.id)));
    // }
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
