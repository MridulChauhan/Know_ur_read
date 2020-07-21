import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowurread/main_screens/features_screen.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/main_screens/text_scanner_screen.dart';
import 'package:knowurread/services/navigation.dart';
import 'package:knowurread/welcome_screens/welcome_screen1.dart';
import 'package:knowurread/welcome_screens/welcome_screen2.dart';
import 'package:knowurread/welcome_screens/welcome_screen3.dart';
import 'package:knowurread/welcome_screens/welcome_screen4.dart';
import 'package:knowurread/main_screens/text_summarizer_screen.dart';
import 'package:knowurread/main_screens/sentiment_analysis_screen.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageViewNavigation(),
      ),
      routes: {
        WelcomeScreen1.id: (context) => WelcomeScreen1(),
        WelcomeScreen2.id: (context) => WelcomeScreen2(),
        WelcomeScreen3.id: (context) => WelcomeScreen3(),
        WelcomeScreen4.id: (context) => WelcomeScreen4(),
        LoginPage.id: (context) => LoginPage(),
        FeaturesPage.id: (context) => FeaturesPage(),
        TextScannerScreen.id: (context) => TextScannerScreen(),
        TextSummarizerScreen.id: (context) => TextSummarizerScreen(),
        SentimentAnalysisScreen.id: (context) => SentimentAnalysisScreen(),
      },
    );
  }
}
