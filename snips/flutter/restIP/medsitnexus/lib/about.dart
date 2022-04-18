import 'package:flutter/material.dart';
import 'includes/widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40,),
                Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'We are a highly experienced and specialized team who efficiently manages all stages of the medical billing process to ensure that each claim is paid as early as possible. We emphasis you to concentrate on your patient care while we carry out your all billing operations with a high level of precision.',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20,),
                Text(
                  'Our Values',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget> [
                    Icon(Icons.gesture, color:Colors.indigo[900], size: 40,),
                    Text('Building relations on the basis of our \n quality work.', style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget> [
                    Icon(Icons.gesture, color:Colors.indigo[900], size: 40,),
                    Text('We constantly strive for innovation and \n excellence', style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget> [
                    Icon(Icons.gesture, color:Colors.indigo[900], size: 40,),
                    Text('Culture of knowledge sharing and \n continuous growth', style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget> [
                    Icon(Icons.gesture, color:Colors.indigo[900], size: 40,),
                    Text('Professional work environment with \n respect', style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget> [
                    Icon(Icons.gesture, color:Colors.indigo[900], size: 40,),
                    Text('Building relations on the basis of a \n High standards of personal and \n professional ethicsour quality work.', style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 20,),
                Image(image: AssetImage('assets/medicalBilling.jpg')),
                SizedBox(height: 20,),
                cardDisplay(Icons.check_circle_outline , 'Our Mission', 'Our mission is to create value for customers. Don’t just think of the possibilities, experience it. We create smart things for smarter businesses.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.check_circle_outline , 'Our Plan', 'Shorten revenue cycle, fix payer rejections, and correct coding, increase collections for Providers and Healthcare Specialist.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.check_circle_outline , 'Our Vision', 'To be the ‘partner of choice’ for Medical Billing Outsourcing services to Healthcare companies and medical practices and serves as building blocks for our organization.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.check_circle_outline , 'Offering', 'End-to-End Medical Billing Services, Entering patient Demographics, Delivers high quality medical coding solutions, we provide ICD-10, HCPCS, E/M, and DME Coding Solution.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.check_circle_outline , 'Approach', 'Prepare and send timely billing statements. Prepare and send clear and complete billing statements that include contact information and remittance information.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.check_circle_outline , 'Excellence', 'MedsIT Nexus Inc." has established itself as a leading name in providing exceptional Medical Billing and Coding Services that always adhere to globally recognized standards and latest technology trends.'),
                SizedBox(height: 20,),
                Image(image: AssetImage('assets/medicalCoding.jpg')),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(context,0),
    );
  }
}
