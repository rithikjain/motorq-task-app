import 'package:flutter/material.dart';

const surfaceColor = Color(0xFF082032);
const cardColor = Color(0xFF2C394B);
const accentColor = Color(0xFFFF004D);

final AppBarTheme appBarTheme = AppBarTheme(
  color: surfaceColor,
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
  brightness: Brightness.dark,
  elevation: 2,
);

final InputDecorationTheme inputTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
  fillColor: cardColor,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);

final pageTransition = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  },
);

final ThemeData theme = ThemeData(
  fontFamily: 'Rubik',
  primaryColor: accentColor,
  accentColor: accentColor,
  scaffoldBackgroundColor: surfaceColor,
  cardColor: cardColor,
  brightness: Brightness.dark,
  pageTransitionsTheme: pageTransition,
  inputDecorationTheme: inputTheme,
  appBarTheme: appBarTheme,
);
