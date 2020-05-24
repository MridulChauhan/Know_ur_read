import 'package:flutter/material.dart';

const kTitleStyle = TextStyle(
    fontSize: 30, fontFamily: 'PermanentMarker', fontWeight: FontWeight.w900);

const kDescriptionStyle =
    TextStyle(fontSize: 25, fontFamily: 'Piedra', fontWeight: FontWeight.w400);

const kLoginDecoration = TextStyle(
  fontSize: 45.0,
  fontFamily: 'Piedra',
  color: Colors.black54,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black54,
      offset: Offset(5.0, 5.0),
    ),
  ],
);

const kLoginScreenContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(50.0),
    topLeft: Radius.circular(50.0),
  ),
);
