import 'package:flutter/material.dart';
import 'package:knowurread/welcome_screens/welcome_screen1.dart';
import 'package:knowurread/welcome_screens/welcome_screen2.dart';
import 'package:knowurread/welcome_screens/welcome_screen3.dart';
import 'package:knowurread/welcome_screens/welcome_screen4.dart';

const kTitleStyle = TextStyle(
    fontSize: 30,
    fontFamily: 'PermanentMarker',
    fontWeight: FontWeight.w900,
    color: Colors.black);

const kDescriptionStyle = TextStyle(
    fontSize: 25,
    fontFamily: 'Piedra',
    fontWeight: FontWeight.w400,
    color: Colors.black54);

const kLoginDecoration = TextStyle(
  fontSize: 45.0,
  fontFamily: 'Piedra',
  color: Colors.black54,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black54,
      offset: Offset(5.0, 5.0),
    ),
  ],
);

const kLoginScreenContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(50.0),
    topLeft: Radius.circular(50.0),
  ),
);

final controller = PageController(initialPage: 0, viewportFraction: 1.0);

final List<Widget> pages = <Widget>[
  WelcomeScreen1(),
  WelcomeScreen2(),
  WelcomeScreen3(),
  WelcomeScreen4(),
];
