import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/main_screens/main_screen.dart';
import 'package:knowurread/welcome_screens/welcome_screen1.dart';
import 'package:knowurread/welcome_screens/welcome_screen2.dart';
import 'package:knowurread/welcome_screens/welcome_screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: WelcomeScreen1.id,
      routes: {
        WelcomeScreen1.id: (context) => WelcomeScreen1(),
        WelcomeScreen2.id: (context) => WelcomeScreen2(),
        WelcomeScreen3.id: (context) => WelcomeScreen3(),
        LoginPage.id: (context) => LoginPage(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}
