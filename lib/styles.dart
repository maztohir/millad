import 'package:flutter/material.dart';
import 'package:millad/data/palette.dart';

const String FontNameDefault = 'Source Sans Pro';

const LogoText = TextStyle(
    fontSize: 19.0,
    fontStyle: FontStyle.italic,
    color: Palette.primaryText
  );

const TitleText = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w600,
  fontSize: 24.0,
  color: Colors.black87,
);

const BodyText = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  color: Colors.black87,
);