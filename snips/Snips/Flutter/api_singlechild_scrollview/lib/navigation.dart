import 'package:api_singlechild_scrollview/showAll.dart';
import 'package:flutter/material.dart';

import 'addNew.dart';


Widget drawer(context){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Admin',
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                'Dashboard',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard_outlined),
                title: Text('Add New'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNew()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.details_rounded),
                title: Text('ShowAll'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowAll()),
                  );
                },
              ),

            ],
          ),
        ),
      ],
    ),
  );
}

















