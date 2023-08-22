import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';

ThemeData greenTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: AppColorConstants.secondaryGreen,
    scaffoldBackgroundColor: AppColorConstants.bgGreen,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorConstants.transparentColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.transparentColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: AppColorConstants.secondaryGreen,
      ),
      titleTextStyle: AppStylesConstants.appBarStyle,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.primaryGreen,
      foregroundColor: AppColorConstants.whiteColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorConstants.bgGreen,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorConstants.primaryGreen,
        splashFactory: NoSplash.splashFactory,
        shadowColor: AppColorConstants.transparentColor,
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColorConstants.whiteColor,
      tileColor: AppColorConstants.whiteColor,
      selectedTileColor: AppColorConstants.thirdGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textColor: AppColorConstants.textColor,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      color: AppColorConstants.secondaryGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColorConstants.whiteColor),
    ),
  );
}
