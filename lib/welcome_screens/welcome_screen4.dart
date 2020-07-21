import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen4 extends StatefulWidget {
  static const String id = 'welcome_screen4';

  @override
  _WelcomeScreen4State createState() => _WelcomeScreen4State();
}

class _WelcomeScreen4State extends State<WelcomeScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KnowUrReadConst.kWelcomeScrnBackgrndColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: KnowUrReadConst.kVerticalPadding,
            horizontal: KnowUrReadConst.kHorizontalPadding * 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
                radius: 120,
                backgroundColor: Colors.black26,
                child: Image.asset('assets/ocr.png')),
            Text('Text Scanning (OCR)', style: KnowUrReadConst.kTitleStyle),
            Text(
              "Just upload a screenshot/image or just use your camera to perform text scanning",
              style: KnowUrReadConst.kDescriptionStyle,
              textAlign: TextAlign.center,
            ),
            RoundedButton(
              text: 'Skip',
              onPress: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              colour: Colors.white10,
              minWidth: ScreenUtil().setWidth(150),
            ),
            Container(
              child: SmoothPageIndicator(
                controller: KnowUrReadConst.controller, // PageController
                count: KnowUrReadConst.pages.length,
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
