import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  var statusDetail;
  Status({this.statusDetail});
  IconData icon;

  @override
  Widget build(BuildContext context) {
    if(statusDetail=='Success'){
      icon=Icons.check_circle_outline;
    }
    else{
      icon=Icons.close_rounded;
    }
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
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon,color: Colors.white,size: 100,),
                Text(statusDetail,style: TextStyle(color: Colors.white,fontSize: 50),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lime,
                      borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)
                      ),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_outlined,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Go Back",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
