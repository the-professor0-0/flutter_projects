import 'package:flutter/material.dart';
import 'package:medsitnexus/includes/widgets.dart';

class WhyChooseUs extends StatelessWidget {
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
                  'WHY CHOOSE USE',
                  style: TextStyle(
                    fontSize:24,
                    color: Colors.indigo[900],
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 40,),
                cardDisplay(Icons.public, 'Great Infrastructure','Our infrastructure and State of the Art management practices make us capable of handling a huge maaxzgnitude of clients. Whether it’s a simple one time keying requirement or an aggressive insurance follow up, MedsIT Nexus Inc. has the right solution for you.'),
                cardDisplay(Icons.supervisor_account, 'Qualified Billers','MedsIT Nexus Inc. processes all claims through a rules based system that reduces the risk of billing errors and denials.'),
                cardDisplay(Icons.laptop_chromebook_rounded, 'Professional Team','Our comprehensive services are designed to maximize your profit while minimizing your costs. We handle all the hassles of dealing with the insurance companies while continuously working for your maximum reimbursements.'),
                cardDisplay(Icons.cases, 'HIPAA Compliance','The Health Insurance Portability and Accountability Act of 1996 (HIPAA) is a significant health care reform law that passed Congress in 1996. The law has its roots in the Clinton Health Reform proposal, and its primary purpose was to provide better access to health insurance as well as to toughen the law concerning healthcare billing fraud.'),
                cardDisplay(Icons.settings_outlined, 'Quality Control','MedsIT Nexus follows AAMT standards to ensure high quality transcription work to healthcare organizations. We have a comprehensive quality policy in place, and no files or data leave the server until all accuracy standards are met.'),
                SizedBox(height: 40,),
                Image( image: AssetImage('assets/whyChooseUs.jpg'), ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
