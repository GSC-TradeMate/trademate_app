import 'package:flutter/material.dart';
import 'package:trademate_app/theme/palette.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Palette.white,
      surfaceTintColor: Palette.white,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Palette.white,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        surfaceTintColor: WidgetStatePropertyAll(
          Palette.white,
        ),
      ),
    ),
    scaffoldBackgroundColor: Palette.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Palette.primaryDef)
        .copyWith(secondary: Palette.primaryDef),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Palette.outline,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Palette.primaryDef,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Palette.outline,
          width: 1.5,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Palette.outline,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Palette.outline,
          width: 1.5,
        ),
      ),
    ),
  );
}
