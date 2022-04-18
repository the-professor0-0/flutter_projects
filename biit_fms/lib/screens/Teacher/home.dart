import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(1),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: getCourses(),
                    builder: (BuildContext context,AsyncSnapshot snapshot) {
                      var snap = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child:CircularProgressIndicator()
                        );
                      }
                      if(snapshot.hasError){
                      }
                      try{
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snap.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return subjectCard(context, snap[index]);
                          },
                        );
                      }catch(e){
                        return const Center(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
