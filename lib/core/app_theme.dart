import 'package:flutter/material.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_style.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: LightThemeColor.primaryLight,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.red,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black45),
      centerTitle: true,
      titleTextStyle: h2Style,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.red,
        ),
      ),
    ),
    hintColor: Colors.black45,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: textFieldStyle,
      focusedBorder: textFieldStyle,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: h1Style,
      displayMedium: h2Style,
      displaySmall: h3Style,
      headlineMedium: h4StyleLight,
      headlineSmall: h5StyleLight,
      bodyLarge: bodyTextLight,
      titleMedium: subtitleLight,
    ),
    iconTheme: const IconThemeData(color: Colors.black45),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    canvasColor: DarkThemeColor.primaryDark,
    scaffoldBackgroundColor: DarkThemeColor.primaryDark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.red,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: TextStyle(color: Colors.white),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: h2Style,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.red,
        ),
      ),
    ),
    hintColor: Colors.white60,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: textFieldStyle,
      focusedBorder: textFieldStyle,
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: DarkThemeColor.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: DarkThemeColor.primaryLight,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white70,
    ),
    textTheme: TextTheme(
      displayLarge: h1Style.copyWith(color: Colors.white),
      displayMedium: h2Style.copyWith(color: Colors.white),
      displaySmall: h3Style.copyWith(color: Colors.white),
      headlineMedium: h4StyleLight.copyWith(color: Colors.white),
      headlineSmall: h5StyleLight.copyWith(color: Colors.white),
      bodyLarge: bodyTextLight.copyWith(color: Colors.white),
      titleMedium: subtitleLight.copyWith(color: Colors.white60),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: DarkThemeColor.primaryLight,
    ),
  );
}
