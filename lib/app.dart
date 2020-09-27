import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './styles.dart';

import './storage/route.dart';
import './storage/palette.dart';

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
        textTheme: TextTheme(bodyText2: BodyBackgroundText),
        primaryColor: Palette.primary);
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
