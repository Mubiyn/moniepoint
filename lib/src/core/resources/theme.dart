import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/src/core/resources/resources.dart';

String? _fontFamily = GoogleFonts.inter().fontFamily;

FlexSchemeData _moniePointScheme = const FlexSchemeData(
  name: 'theme scheme',
  description: 'base theme',
  light: FlexSchemeColor(
    primary: kPrimaryColor,
    primaryContainer: kBackgroundColor,
    secondary: kColorOrange,
    secondaryContainer: kColorOrange,
  ),
  dark: FlexSchemeColor(
    primary: kPrimaryColor,
    primaryContainer: kColorBlack,
    secondary: kColorGrey,
    secondaryContainer: kColorGrey,
  ),
);

ThemeData lightTheme = FlexThemeData.light(
    fontFamily: _fontFamily,
    scheme: FlexScheme.flutterDash,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        fontSize: textFontSize,
        fontWeight: FontWeight.w500,
        color: kTextColor1,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: textFontSize,
        fontWeight: FontWeight.w400,
        color: kTextColor2,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: textFontSize * 0.9,
        fontWeight: FontWeight.w400,
        color: kTextColor2,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: h1FontSize,
        fontWeight: FontWeight.w800,
        color: kTextColor1,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: h2FontSize,
        fontWeight: FontWeight.w600,
        color: kTextColor1,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: h3FontSize,
        fontWeight: FontWeight.w500,
        color: kTextColor1,
      ),
    ),
    scaffoldBackground: kBackgroundColor,
    useMaterial3: true,
    colors: _moniePointScheme.light);

ThemeData darkTheme = FlexThemeData.dark(
    fontFamily: _fontFamily,
    scheme: FlexScheme.flutterDash,
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
          fontSize: textFontSize,
          fontWeight: FontWeight.w500,
          color: kColorWhite,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: textFontSize,
          fontWeight: FontWeight.w400,
          color: kColorWhite,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: textFontSize * 0.9,
          fontWeight: FontWeight.w400,
          color: kColorWhite,
        ),
        displayLarge: GoogleFonts.inter(
          fontSize: h1FontSize,
          fontWeight: FontWeight.w800,
          color: kColorWhite,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: h2FontSize,
          fontWeight: FontWeight.w600,
          color: kColorWhite,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: h3FontSize,
          fontWeight: FontWeight.w500,
          color: kColorWhite,
        )),
    scaffoldBackground: kColorBlack,
    useMaterial3: true,
    colors: _moniePointScheme.dark);

extension FastColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;

  Color get secondary => colorScheme.secondary;

  Color get tertiary => colorScheme.tertiary;

  Color get primaryContainer => colorScheme.primaryContainer;

  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get onPrimary => colorScheme.onPrimary;

  Color get onSecondary => colorScheme.onSecondary;

  Color get onTertiary => colorScheme.onTertiary;

  Color get background => colorScheme.background;

  Color get onBackground => colorScheme.onBackground;

  Color get surface => colorScheme.surface;

  Color get onSurface => colorScheme.onSurface;

  Color get surfaceTint => colorScheme.surfaceTint;

  Color get error => colorScheme.error;

  Color get onError => colorScheme.onError;

  Color get outline => colorScheme.outline;

  Color get inversePrimary => colorScheme.inversePrimary;

  Color get inverseSurface => colorScheme.inverseSurface;

  Color get onInverseSurface => colorScheme.onInverseSurface;
}
