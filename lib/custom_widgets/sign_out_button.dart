import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowurread/other_files/sign_in.dart';

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.signOutAlt),
      onPressed: () {
        SignInMethods().signOutGoogle();
        Navigator.pop(context);
      },
    );
  }
}
