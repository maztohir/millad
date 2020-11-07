import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:millad/storage/global_conf.dart';

import 'storage/global_text_style.dart';

import './storage/route.dart';
import 'storage/global_color.dart';

import './page/home.dart';
import './page/book.dart';
import './page/content.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        child: MaterialApp(
          theme: _themeData(),
          home: Home(),
          onGenerateRoute: _routes(),
        ),
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ));
  }

  static ThemeData _themeData() {
    return ThemeData(
        textTheme: TextTheme(
          bodyText2: bodyBackgroundTextStyle(),
        ),
        primaryColor: primaryColor());
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case AppRoute.BOOK_PAGE:
          screen = Book(arguments['book']);
          break;
        case AppRoute.BOOK_CONTENT_PAGE:
          screen = Content(arguments['book'], arguments['index']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
