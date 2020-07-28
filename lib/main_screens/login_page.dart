import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:knowurread/main_screens/features_screen.dart';
import 'package:knowurread/utils/constants.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:knowurread/services/sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:knowurread/utils/teddy_controller.dart';
import 'package:knowurread/custom_widgets/tracking_text_input.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  bool _visible = true;
  bool showSpinner = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  TeddyController _teddyController;

  @override
  void initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  void toggleVisibility() {
    setState(() {
      _visible = !_visible;
    });
  }

  void enableSpinner() {
    setState(() {
      if (email != null && password != null) showSpinner = true;
      _visible = !_visible;
    });
  }

  void disableSpinner() {
    setState(() => showSpinner = false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[600],
                  Colors.orange[200],
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: KnowUrReadConst.kVerticalPadding * 0.5),
                  child: Column(
                    children: <Widget>[
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(100),
                      //   child: AnimatedOpacity(
                      //     opacity: _visible ? 1.0 : 0.1,
                      //     duration: Duration(milliseconds: 500),
                      //     child: Image.asset(
                      //       'images/app_icon.png',
                      //       height: ScreenUtil().setHeight(80),
                      //       width: ScreenUtil().setWidth(80),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 25),
                      //   child: Center(
                      //     child: Text(
                      //       "Hi, try typing here !",
                      //       style: KnowUrReadConst.kLoginDecoration,
                      //     ),
                      //   ),
                      //   ),
                      // child: TypewriterAnimatedTextKit(
                      //   text: ["Login"],
                      //   speed: Duration(milliseconds: 500),
                      //   textStyle: KnowUrReadConst.kLoginDecoration,
                      // ),

                      Container(
                        height: ScreenUtil().setHeight(200),
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: FlareActor(
                          "assets/Teddy.flr",
                          shouldClip: false,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.contain,
                          controller: _teddyController,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: KnowUrReadConst.kLoginScreenContainerDecoration,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                KnowUrReadConst.kHorizontalPadding * 1.5),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: ScreenUtil().setHeight(30)),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'Try typing something !',
                                      style: KnowUrReadConst.kDescriptionStyle,
                                    ),
                                  ),
                                  TrackingTextInput(
                                    label: "Email",
                                    hint: "What's your email address?",
                                    onCaretMoved: (Offset caret) {
                                      _teddyController.lookAt(caret);
                                    },
                                    onTextChanged: (String value) {
                                      email = value;
                                      //_teddyController.setEmail(value);
                                    },
                                  ),
                                  TrackingTextInput(
                                    label: "Password",
                                    hint: "Try one...",
                                    isObscured: true,
                                    onCaretMoved: (Offset caret) {
                                      _teddyController.coverEyes(caret != null);
                                      _teddyController.lookAt(null);
                                    },
                                    onTextChanged: (String value) {
                                      password = value;
                                      //_teddyController.setPassword(value);
                                    },
                                  ),
                                  SizedBox(height: ScreenUtil().setHeight(10)),
                                  // TextField(
                                  //   onTap: () {
                                  //     toggleVisibility();
                                  //   },
                                  //   onChanged: (newValue) {
                                  //     email = newValue;
                                  //   },
                                  //   keyboardType: TextInputType.emailAddress,
                                  //   textAlign: TextAlign.center,
                                  //   decoration: InputDecoration(
                                  //       hintText: "Enter your Email id",
                                  //       hintStyle:
                                  //           TextStyle(color: Colors.grey),
                                  //       border: InputBorder.none),
                                  // ),
                                  // Divider(
                                  //     thickness: 1, color: Colors.grey[200]),
                                  // TextField(
                                  //   onTap: () {
                                  //     toggleVisibility();
                                  //   },
                                  //   onChanged: (newValue) {
                                  //     password = newValue;
                                  //   },
                                  //   textAlign: TextAlign.center,
                                  //   obscureText: true,
                                  //   decoration: InputDecoration(
                                  //       hintText: "Enter your Password",
                                  //       hintStyle:
                                  //           TextStyle(color: Colors.grey),
                                  //       border: InputBorder.none),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedButton(
                                  minWidth: ScreenUtil().setWidth(130),
                                  colour: Colors.lightBlue[900],
                                  text: 'Login',
                                  onPress: () async {
                                    if (email != null && password != null) {
                                      enableSpinner();
                                      await SignInMethods()
                                          .loginUser(context, email, password);
                                      disableSpinner();
                                    } else
                                      TeddyController().playFail();
                                  },
                                ),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                RoundedButton(
                                  minWidth: ScreenUtil().setWidth(130),
                                  colour: Colors.lightBlue[900],
                                  onPress: () async {
                                    if (email != null && password != null) {
                                      enableSpinner();
                                      await SignInMethods().registerUser(
                                          context, email, password);
                                      disableSpinner();
                                    }
                                  },
                                  text: 'Register',
                                ),
                              ],
                            ),
                            RoundedButton(
                              colour: Color.fromRGBO(66, 133, 244, 1),
                              onPress: () async {
                                toggleVisibility();
                                enableSpinner();
                                var result =
                                    await SignInMethods().signInWithGoogle();
                                print(result);
                                if (result == "success")
                                  Navigator.pushNamed(context, FeaturesPage.id);
                                else
                                  print("failed");
                                disableSpinner();
                              },
                              text: 'Sign in with Google',
                            ),
                            //SizedBox(height: ScreenUtil().setHeight(15)),
                            AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: _visible ? 0.1 : 1.0,
                              child: Text(
                                'Know ur read',
                                style: KnowUrReadConst.kTitleStyle.copyWith(
                                  fontFamily: 'Piedra',
                                  color: Colors.red[300],
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
