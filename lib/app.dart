import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './styles.dart';

import './data/route.dart';
import './data/palette.dart';

import './page/home.dart';
import './page/welcome.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: MaterialApp(
        theme: _themeData(),
        home: Home(),
        onGenerateRoute: _routes(),
      ),
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent,)
    );
  }

  static ThemeData _themeData(){
    return ThemeData(
      textTheme: TextTheme(bodyText2: BodyText),
      primaryColor: Palette.primary
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case AppRoute.WELLCOME_PAGE:
          screen = Welcome();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}