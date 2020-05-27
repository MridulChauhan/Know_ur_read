import 'package:flutter/material.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen1 extends StatefulWidget {
  static const String id = 'welcome_screen1';

  @override
  _WelcomeScreen1State createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends State<WelcomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              radius: 120,
              backgroundColor: Colors.black26,
              child: Image.asset(
                'images/news.png',
                height: 180,
              ),
            ),
            Text(
              'Hello There !',
              style: kTitleStyle,
            ),
            Text(
              "Don't know what to believe and what not to in the digital world ?",
              style: kDescriptionStyle,
              textAlign: TextAlign.center,
            ),
            RoundedButton(
              text: 'Skip',
              onPress: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              colour: Colors.white10,
              minWidth: 150,
            ),
            Container(
              child: SmoothPageIndicator(
                controller: controller, // PageController
                count: pages.length,
                effect: WormEffect(
                    activeDotColor: Colors.white), // your preferred effect
              ),
            ),
          ],
        ),
      ),
    );
  }
}
