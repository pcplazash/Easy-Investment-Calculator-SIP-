import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xffffffff);
  static Color lightPrimaryColor = const Color(0xffB4F2F1);
  static Color lightSecondaryColor = const Color(0xff1E6261);
  static Color lightTextColor = const Color(0xff1F2833);

  static Color darkBackgroundColor = const Color(0xff000000);
  static Color darkPrimaryColor = const Color(0xffB4F2F1);
  static Color darkSecondaryColor = const Color(0xff1E6261);
  static Color darkTextColor = const Color(0xffffffff);

  const AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
      background: lightBackgroundColor,
      outline: lightTextColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      background: darkBackgroundColor,
      outline: darkTextColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
