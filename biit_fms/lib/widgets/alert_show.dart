import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:flutter/material.dart';

showAlertIngredient(BuildContext context,snap,name) {
  AlertDialog alert = AlertDialog(
    content: Container(
      width: 100,
      height: 120,
      child: FutureBuilder(
          future: getClos(snap['COURSE_NO']),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            try {
              var snap = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {}
              return ListView.builder(
                itemCount: snap.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(snap[index]['code']+' : '+ snap[index][name].toString()),
                    ],
                  );
                },
              );
            } catch (e) {
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
          }),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}