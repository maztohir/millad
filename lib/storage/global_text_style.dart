import 'package:flutter/material.dart';

import './global_color.dart';

const String fontNameDefault = 'Source Sans Pro';

logoTextStyle() => TextStyle(
      fontSize: 19.0,
      fontStyle: FontStyle.italic,
      color: primaryTextColor(),
    );

appBarTextStyle() => TextStyle(
      fontSize: 18.0,
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w400,
      color: primaryTextColor(),
    );

titlePrimaryTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: primaryTextColor(),
    );

titlePrimaryText1Style() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
      color: primaryTextColor(),
    );

arabTitleTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      color: primaryTextColor(),
    );

bodyPrimaryTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
      color: primaryText01Color(),
    );

bodyPrimaryText1Style() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w200,
      fontSize: 12.0,
      color: primaryTextColor(),
    );

titleBackgroundTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: backgroundTextColor(),
    );

titleBackgroundText1Style() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
      color: backgroundTextColor(),
    );

bodyBackgroundTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
      color: backgroundTextColor(),
    );

bodyBackgroundText1Style() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.w200,
      fontSize: 12.0,
      color: backgroundTextColor(),
    );

contentArabicTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: backgroundTextColor(),
    );

contentTranslateTextStyle() => TextStyle(
      fontFamily: fontNameDefault,
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
      color: backgroundTextColor(),
    );

hideTextStyle() => TextStyle(
      fontSize: 0,
    );
