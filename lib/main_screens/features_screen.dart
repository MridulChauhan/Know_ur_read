import 'package:flutter/material.dart';
import 'package:knowurread/custom_widgets/sign_out_button.dart';
import 'package:knowurread/main_screens/text_scanner_screen.dart';
import 'package:knowurread/main_screens/text_summarizer_screen.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:knowurread/other_files/is_first_launch.dart';
import 'package:showcaseview/showcase.dart';
import 'package:showcaseview/showcase_widget.dart';

class FeaturesPage extends StatefulWidget {
  static const String id = 'features_page';
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING_FeaturesPage";

  @override
  _FeaturesPageState createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  GlobalKey _one = GlobalKey();
  BuildContext myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      IsFirstLaunch().isFirstLaunch(FeaturesPage).then((result) {
        if (result) ShowCaseWidget.of(myContext).startShowCase([_one]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Features"),
              backgroundColor: Colors.redAccent,
              actions: <Widget>[
                Showcase(
                    title: 'Sign out',
                    description: 'Press to sign out',
                    key: _one,
                    showcaseBackgroundColor: Colors.yellowAccent,
                    child: SignOutButton())
              ],
            ),
            body: Center(
              child: Text(
                'Hola amigo ! \n\n Explore the features that power your digital life with know ur read',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        'Know ur Read \n Features',
                        style: kTitleStyle.copyWith(color: Colors.grey[900]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Image.asset('images/ocr.png'),
                    title: Text(
                      'Text Scanner',
                      style: kDescriptionStyle,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, TextScannerScreen.id);
                    },
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Image.asset(
                      'images/summarizer.jpg',
                      width: 50,
                    ),
                    title: Text(
                      'Text Summariser',
                      style: kDescriptionStyle,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, TextSummarizerScreen.id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
