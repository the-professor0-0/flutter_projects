import 'package:flutter/material.dart';
import 'package:medsitnexus/includes/widgets.dart';

class Offerings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40,),
                Text(
                  'What We Offer',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 40,),
                cardDisplay(Icons.check_circle,'Complete Package', 'Getting a business off the ground is challenging for anyone, especially with the ever-changing conditions facing physicians today. Our Simple Start program for new practices can help reduce the start-up challenges while keeping your initial costs and overhead to a minimum.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.list_alt_rounded,'Commitment', 'MedsIT Nexus Inc. would not act as an outsourcing company but as an extended arm of your office. Our tailored unique approach results in improved productivity, faster Turnaround Time, increased efficiency and enhanced revenues.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.medical_services,'Services', 'Our experience and knowledge is our main source of an increase in our clientage every year, MedsIT Nexus specializes in strengthening the financial roots of Doctors by providing an Excellent Service which comes with a merger of our trained HR and management processes.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.supervised_user_circle ,'Partnership', 'MedsIT Nexus Inc. is an end-to-end Medical Billing Service that features daily claims submission, follow-up and denial management. We help Physicians to keep their primary focus on their practices as we take care of their all Back-end work'),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
