import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:knowurread/welcome_screens/welcome_screen3.dart';

class WelcomeScreen2 extends StatelessWidget {
  static const String id = 'welcome_screen2';
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
                child: Image.asset('images/ocr.png')),
            Text('know ur read', style: kTitleStyle),
            Text(
              "A tool to help you know what you read and share",
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
                    Navigator.pushNamed(context, WelcomeScreen3.id);
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
