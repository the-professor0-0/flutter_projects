import 'package:ali_rams/widgets/app_bar.dart';
import 'package:ali_rams/widgets/bottom_nav.dart';
import 'package:ali_rams/widgets/buttons.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Constant.blueColor.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            image: const DecorationImage(
                                image: AssetImage('assets/circleAvatar.png'))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Successfully Sent to',
                        style: TextStyle(fontSize: 22,color: Colors.green),
                      ),
                      const Text(
                        'Account Number : 356600202036',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Text(
                        'Amount Rs. 2000',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Text(
                        'Message : hello World',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20,),
                      submitButton("Go to Home", context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(context, 0),
    );
  }
}
