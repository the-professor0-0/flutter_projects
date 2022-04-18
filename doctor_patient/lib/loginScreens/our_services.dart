import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class OurServices extends StatefulWidget {
  const OurServices({Key? key}) : super(key: key);

  @override
  _OurServicesState createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Our Services"),
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
              'People whose memory issues are due to aging, a medical condition, or dementia may benefit from therapy that teaches them compensatory strategies for dealing with memory loss. Therapy can also provide support to such individuals and help them to process their feelings about their memory loss. \nMental Health is using any tactile stimulation to affect the cognitive memory." In other words, by opening and heightening all of your senses to familiar objects, smells and tastes, your brain will trigger past memories or moments associated with those sensory objects',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNav(context, 1),
    );
  }
}
