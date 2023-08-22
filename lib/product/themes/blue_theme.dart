import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';

ThemeData blueTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(

    primaryColor: AppColorConstants.secondaryBlue,
    scaffoldBackgroundColor: AppColorConstants.bgBlue,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: AppColorConstants.transparentColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.transparentColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: AppColorConstants.secondaryBlue,
      ),
      titleTextStyle: AppStylesConstants.appBarStyle,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.primaryBlue,
      foregroundColor: AppColorConstants.whiteColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorConstants.bgBlue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorConstants.primaryBlue,
        splashFactory: NoSplash.splashFactory,
        shadowColor: AppColorConstants.transparentColor,
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColorConstants.whiteColor,
      tileColor: AppColorConstants.whiteColor,
      selectedTileColor: AppColorConstants.thirdBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textColor: AppColorConstants.textColor,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      color: AppColorConstants.secondaryBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColorConstants.whiteColor),
    ),
  );
}
