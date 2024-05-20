import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeDetails {
  ThemeData themeDetails = ThemeData(
    useMaterial3: true,
    textTheme: Platform.isIOS ? _cupertinoTextTheme : null,
  );
}

TextTheme _cupertinoTextTheme = TextTheme(
  headlineMedium: const CupertinoThemeData()
      .textTheme
      .navLargeTitleTextStyle
      .copyWith(letterSpacing: -1.5),
  titleLarge: const CupertinoThemeData().textTheme.navTitleTextStyle,
);
