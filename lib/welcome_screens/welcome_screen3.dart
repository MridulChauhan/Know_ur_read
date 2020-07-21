import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/utils/constants.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen3 extends StatefulWidget {
  static const String id = 'welcome_screen3';

  @override
  _WelcomeScreen3State createState() => _WelcomeScreen3State();
}

class _WelcomeScreen3State extends State<WelcomeScreen3> {
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
                borderRadius: BorderRadius.circular(150),
                child: Image.asset('assets/sentiment.png'),
              ),
            ),
            Text(
              'Caption Generation !',
              style: KnowUrReadConst.kTitleStyle,
            ),
            Text(
              "Have your content speak to you, with the power of ML and AI ! ",
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
