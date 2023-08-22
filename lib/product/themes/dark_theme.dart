import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: AppColorConstants.bgDark,
    scaffoldBackgroundColor: AppColorConstants.bgDark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColorConstants.transparentColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.transparentColor,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(
        color: AppColorConstants.primaryLight,
      ),
      titleTextStyle: AppStylesConstants.appBarStyle
          .copyWith(color: AppColorConstants.whiteColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorConstants.primaryDark,
      foregroundColor: AppColorConstants.whiteColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorConstants.bgDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorConstants.primaryDark,
        splashFactory: NoSplash.splashFactory,
        shadowColor: AppColorConstants.transparentColor,
        elevation: 0,
        shape: const StadiumBorder(),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColorConstants.whiteColor,
      tileColor: AppColorConstants.whiteColor,
      selectedTileColor: AppColorConstants.thirdDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      textColor: AppColorConstants.textColor,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      color: AppColorConstants.secondaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColorConstants.whiteColor),
    ),
  );
}
