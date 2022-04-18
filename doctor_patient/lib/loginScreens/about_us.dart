import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("About Us"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
            Image(
              image: AssetImage('assets/logo.png'),
              width: 100,
            ),
            SizedBox(height: 20,),
            Text(
              'Mental Health catches-all term for a controversial and scientifically discredited form of psychotherapy that utilizes one or more unproven interviewing techniques (such as hypnosis, guided imagery, and the use of sedative-hypnotic drugs) to purportedly help patients recall previously forgotten memories.Proponents of recovered memory therapy claim, contrary to evidence, that traumatic memories can be buried in the subconscious and thereby affect current behavior, and that these memories can be recovered through the use of RMT techniques. RMT is not recommended by mainstream ethical and professional mental health associations.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNav(context, 0),
    );
  }
}
