import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowurread/welcome_screens/welcome_screen2.dart';
import 'package:knowurread/other_files/constants.dart';

class WelcomeScreen1 extends StatelessWidget {
  static const String id = 'welcome_screen1';
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
              backgroundColor: Colors.redAccent,
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
            FlatButton(
              child: Icon(
                FontAwesomeIcons.arrowCircleRight,
                size: 50,
                color: Colors.tealAccent,
              ),
              onPressed: () {
                Navigator.pushNamed(context, WelcomeScreen2.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
