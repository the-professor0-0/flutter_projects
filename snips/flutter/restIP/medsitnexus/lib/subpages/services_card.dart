import 'package:flutter/material.dart';
import 'package:medsitnexus/includes/widgets.dart';

class ServicesCard extends StatelessWidget {
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
                  'OUR SERVICES',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'End-To-End Medical Billing & Coding Services. As we focus on quality, our billing services are reliable and will increase your revenue since we put a dedicated billing manager for your effective operations. We offer below services with affordable business model at ease.',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40,),
                cardDisplay(Icons.attach_money_rounded, 'Medical Billing',
                    'MedsIT Nexus Inc. offer End-To-End Medical Billing Services with complete piece of mind and hassle free. Our qualified team will handle your billing from claim creation to payment posting and reporting.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.medical_services_outlined, 'Medical Coding',
                    'We are proficient in CPT & ICD usage which ensure the reimbursable completion of Charge as per LCD/NCD guideline. We continuously update ourselves regarding any coding changes to avoid your revenue cycle delay.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.medical_services_outlined, 'Credentialing',
                    'Keep off this hassle & let us do all credentialing for you. When we do it you can rest assure it that it will be done both correctly & in timely fashion! Our team will help you in re-credentialing, address change, TAX ID registration and more.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.toggle_off_outlined, 'AR Management',
                    'This is most challenging and integral part of revenue cycle management for a provider. At MedsIT Nexus Inc., we have developed a four tier step by step process to clean up the AR and and get maximum reimbursements.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.bar_chart, 'Practice Billing Audit',
                    'MedsIT Nexus Inc. can surely give you “Practice Billing Audit Services” and let you know transparently the grey areas of your practice billing. Not only this, we will show you reports will have detail meeting and will present you the resolution of the problems.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.car_repair, 'Ambulatory  Billing',
                    'Hiring MedsIT Nexus Inc. team to handle your billing is one of the most important decisions you’ll make regarding the financial aspect of your ASC and Transportation Billing.'),
                SizedBox(height: 20,),
                cardDisplay(
                    Icons.add_circle_outline_outlined, 'Pharmacy  Billing',
                    'MedsIT Nexus Inc. can provide you with the required pharmacy billing services which will accelerate your billing procedures by automatically calculating the discounts, taxes, postings, reimbursements, etc.'),
                SizedBox(height: 20,),
                cardDisplay(Icons.sync, 'Customized  Billing',
                    'To make your practice smooth, we work on weekly or monthly customized analysis reports to make sure your account receivable is going good. Reports can be customized to suit customer specifications.'),
                SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
