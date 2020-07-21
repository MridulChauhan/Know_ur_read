import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowurread/main_screens/login_page.dart';
import 'package:knowurread/services/sign_in.dart';

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.signOutAlt),
      onPressed: () {
        SignInMethods().signOutGoogle();
        Navigator.pushNamed(context, LoginPage.id);
      },
    );
  }
}
