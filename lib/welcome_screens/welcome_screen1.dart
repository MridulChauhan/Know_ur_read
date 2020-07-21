import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen1 extends StatefulWidget {
  static const String id = 'welcome_screen1';

  @override
  _WelcomeScreen1State createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends State<WelcomeScreen1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 667, width: 375);
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
              child: Image.asset(
                'assets/news.png',
                height: ScreenUtil().setHeight(180),
              ),
            ),
            Text(
              'Hello There !',
              style: KnowUrReadConst.kTitleStyle,
            ),
            Text(
              "Don't know what to believe and what not to in the digital world ?",
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
