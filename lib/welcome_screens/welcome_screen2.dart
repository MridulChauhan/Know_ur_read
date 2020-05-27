import 'package:flutter/material.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen2 extends StatefulWidget {
  static const String id = 'welcome_screen2';

  @override
  _WelcomeScreen2State createState() => _WelcomeScreen2State();
}

class _WelcomeScreen2State extends State<WelcomeScreen2> {
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
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    'images/app_icon.png',
                    height: 150,
                  ),
                )),
            Text('know ur read', style: kTitleStyle),
            Text(
              "A tool to help you know what you read and share",
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
