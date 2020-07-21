import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowurread/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final Function onPress;
  final String text;
  final double minWidth;
  const RoundedButton(
      {this.colour, @required this.onPress, this.text, this.minWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: KnowUrReadConst.kVerticalPadding * 0.5),
      child: Material(
        elevation: KnowUrReadConst.kElevation,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: minWidth,
          height: ScreenUtil().setHeight(42),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
