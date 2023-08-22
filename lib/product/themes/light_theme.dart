import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: AppColorConstants.thirdLight,
    scaffoldBackgroundColor: AppColorConstants.bgLight,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorConstants.transparentColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.transparentColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: AppColorConstants.blackColor,
      ),
      titleTextStyle: AppStylesConstants.appBarStyle,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.secondaryLight,
      foregroundColor: AppColorConstants.primaryLight,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorConstants.primaryLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorConstants.secondaryLight,
        splashFactory: NoSplash.splashFactory,
        shadowColor: AppColorConstants.transparentColor,
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColorConstants.primaryLight,
      tileColor: AppColorConstants.primaryLight,
      selectedTileColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColorConstants.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColorConstants.whiteColor),
    ),

  );
}
