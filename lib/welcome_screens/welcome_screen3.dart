import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen3 extends StatefulWidget {
  static const String id = 'welcome_screen3';

  @override
  _WelcomeScreen3State createState() => _WelcomeScreen3State();
}

class _WelcomeScreen3State extends State<WelcomeScreen3> {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset('images/sentiment.png'),
              ),
            ),
            Text(
              'Sentiment Analysis !',
              style: kTitleStyle,
            ),
            Text(
              "Get a detailed analysis of your feed with insights",
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
