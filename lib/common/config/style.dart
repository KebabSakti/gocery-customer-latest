import 'package:flutter/material.dart';

import 'const.dart';

class Style {
  static final ThemeData light = ThemeData(
    fontFamily: 'SFPRO',
    scaffoldBackgroundColor: backgroundLight,
    dividerColor: const Color(0xFFEBEBEB),
    colorScheme: const ColorScheme.light(
      primary: primaryLight,
      onPrimary: onPrimaryLight,
      secondary: secondaryLight,
      onSecondary: onSecondaryLight,
      surface: surfaceLight,
      onSurface: onSurfaceLight,
      background: backgroundLight,
      onBackground: onBackgroundLight,
    ),
  );

  static final ThemeData dark = ThemeData(
    fontFamily: 'SFPRO',
    scaffoldBackgroundColor: backgroundDark,
    dividerColor: const Color(0xFF22252F),
    colorScheme: const ColorScheme.dark(
      primary: primaryDark,
      onPrimary: onPrimaryDark,
      secondary: secondaryDark,
      onSecondary: onSecondaryDark,
      surface: surfaceDark,
      onSurface: onSurfaceDark,
      background: backgroundDark,
      onBackground: onBackgroundDark,
    ),
  );
}
