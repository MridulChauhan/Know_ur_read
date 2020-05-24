import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:knowurread/other_files/constants.dart';
import 'package:knowurread/custom_widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:knowurread/main_screens/main_screen.dart';
import 'package:knowurread/other_files/alert_generation.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void toggleVisibility() {
    setState(() {
      _visible = !_visible;
    });
  }

  void enableSpinner() {
    setState(() {
      showSpinner = true;
      _visible = !_visible;
    });
  }

  void disableSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.1,
                        duration: Duration(milliseconds: 500),
                        child: Image.asset(
                          'images/search.jpg',
                          height: 80.0,
                          width: 80.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 180, top: 10),
                      child: TypewriterAnimatedTextKit(
                        text: ["Login"],
                        speed: Duration(milliseconds: 500),
                        textStyle: kLoginDecoration,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: kLoginScreenContainerDecoration,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
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
                                TextField(
                                  onTap: () {
                                    toggleVisibility();
                                  },
                                  onChanged: (newValue) {
                                    email = newValue;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: "Enter your Email id",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                                Divider(thickness: 1, color: Colors.grey[200]),
                                TextField(
                                  onTap: () {
                                    toggleVisibility();
                                  },
                                  onChanged: (newValue) {
                                    password = newValue;
                                  },
                                  textAlign: TextAlign.center,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Enter your Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                minWidth: 130.0,
                                colour: Colors.orange[900],
                                text: 'Login',
                                onPress: () async {
                                  enableSpinner();
                                  try {
                                    AuthResult regUser =
                                        await _auth.signInWithEmailAndPassword(
                                            email: email, password: password);
                                    if (regUser != null)
                                      Navigator.pushNamed(
                                          context, MainScreen.id);
                                  } catch (error) {
                                    AlertGeneration()
                                        .generateAlert(error, context);
                                  }
                                  disableSpinner();
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundedButton(
                                minWidth: 130.0,
                                colour: Colors.orange[900],
                                onPress: () async {
                                  enableSpinner();
                                  try {
                                    final newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    if (newUser != null) {
                                      Navigator.pushNamed(
                                          context, MainScreen.id);
                                      disableSpinner();
                                    }
                                  } catch (error) {
                                    AlertGeneration()
                                        .generateAlert(error, context);
                                    disableSpinner();
                                  }
                                },
                                text: 'Register',
                              ),
                            ],
                          ),
                          RoundedButton(
                            colour: Colors.indigoAccent,
                            onPress: () {
                              toggleVisibility();
                            },
                            text: 'Sign in with Google',
                          ),
                          SizedBox(height: 15),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: _visible ? 0.1 : 1.0,
                            child: Text(
                              'Know ur read',
                              style: kTitleStyle.copyWith(
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
    );
  }
}
