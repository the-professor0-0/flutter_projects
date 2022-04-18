import 'package:flutter/material.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';

class FastingTypes extends StatelessWidget {
  const FastingTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Fasting Types"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Intermittent Fasting",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "What is Intermittent Fasting?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Intermittent fasting, also known as intermittent energy restriction, is an umbrella term for various meal timing schedules that cycle between voluntary fasting and non-fasting over a given period. Methods of intermittent fasting include alternate-day fasting, periodic fasting, and daily time-restricted feeding.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Types",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1. Fasting ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "This is one of the most popular IF methods. In fact,the book The FastDiet made it mainstream, and outlines everything you need to know about this approach. The idea is to eat normally for five days (don’t count calories) and then on the other two eat 500 or 600 calories a day for women and men, respectively. The fasting days are any days of your choosing.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "2. Time-Restricted Fasting",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "For this to work, you may set your eating window from 9 a.m. to 5 p.m., for instance. This can work especially well for someone with a family who eats an early dinner anyway, says Kumar. Then much of the time spent fasting is time spent sleeping anyway. (You also don’t technically have to “miss” any meals, depending on when you set your window.) But this is dependent on how consistent you can be. If your schedule is frequently changing, or you need or want the freedom to go out to breakfast occasionally, head out for a late date night, or go to happy hour, daily periods of fasting may not be for you.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      drawer: userDrawer(context),
    );
  }
}
