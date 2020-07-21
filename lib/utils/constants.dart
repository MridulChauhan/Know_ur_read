import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowurread/welcome_screens/welcome_screen1.dart';
import 'package:knowurread/welcome_screens/welcome_screen2.dart';
import 'package:knowurread/welcome_screens/welcome_screen3.dart';
import 'package:knowurread/welcome_screens/welcome_screen4.dart';

class KnowUrReadConst {
  static TextStyle kTitleStyle = TextStyle(
      fontSize: ScreenUtil().setSp(30),
      fontFamily: 'PermanentMarker',
      fontWeight: FontWeight.w900,
      color: Colors.black);

  static TextStyle kDescriptionStyle = TextStyle(
      fontSize: ScreenUtil().setSp(25),
      fontFamily: 'Piedra',
      fontWeight: FontWeight.w400,
      color: Colors.black54);

  static TextStyle kLoginDecoration = TextStyle(
    fontSize: 30,
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

  static BoxDecoration kLoginScreenContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50.0),
      topLeft: Radius.circular(50.0),
    ),
  );

  static final controller =
      PageController(initialPage: 0, viewportFraction: 1.0);

  static final List<Widget> pages = <Widget>[
    WelcomeScreen1(),
    WelcomeScreen2(),
    WelcomeScreen3(),
    WelcomeScreen4(),
  ];

  static const double kVerticalPadding = 20.0;
  static const double kHorizontalPadding = 20.0;
  static const Color kWelcomeScrnBackgrndColor = Colors.teal;
  static const double kElevation = 10.0;
}
