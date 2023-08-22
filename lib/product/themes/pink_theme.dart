import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';

ThemeData pinkTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: AppColorConstants.secondaryPink,
    scaffoldBackgroundColor: AppColorConstants.bgPink,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorConstants.transparentColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.transparentColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: AppColorConstants.secondaryPink,
      ),
      titleTextStyle: AppStylesConstants.appBarStyle,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.primaryPink,
      foregroundColor: AppColorConstants.whiteColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorConstants.bgPink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorConstants.primaryPink,
        splashFactory: NoSplash.splashFactory,
        shadowColor: AppColorConstants.transparentColor,
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColorConstants.whiteColor,
      tileColor: AppColorConstants.whiteColor,
      selectedTileColor: AppColorConstants.thirdPink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textColor: AppColorConstants.textColor,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      color: AppColorConstants.secondaryPink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.green,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColorConstants.whiteColor),
    ),
  );
}
