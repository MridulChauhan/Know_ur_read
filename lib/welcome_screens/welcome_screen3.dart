import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:knowurread/main_screens/login_page.dart';

class WelcomeScreen3 extends StatelessWidget {
  static const String id = 'welcome_screen3';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Icon(
                    FontAwesomeIcons.arrowCircleLeft,
                    size: 50,
                    color: Colors.tealAccent,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Icon(
                    FontAwesomeIcons.arrowCircleRight,
                    size: 50,
                    color: Colors.tealAccent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
