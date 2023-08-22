import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/product/constants/app_padding_constants.dart';

SnackBar errorSnackBar(BuildContext context) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: const Padding(
      padding: AppPaddingConstants.allPadding2x,
      child: Text(
        AppLanguagesConstants.errorItem,
        style: TextStyle(color: AppColorConstants.whiteColor),
      ),
    ),
    width: 280.0,
    padding: AppPaddingConstants.horizontal8Padding,
    backgroundColor: AppColorConstants.redColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
