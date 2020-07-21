import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/utils/constants.dart';
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    'assets/app_icon.png',
                    height: ScreenUtil().setHeight(150),
                  ),
                )),
            Text('know ur read', style: KnowUrReadConst.kTitleStyle),
            Text(
              "A tool to help you know what you read and share",
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
