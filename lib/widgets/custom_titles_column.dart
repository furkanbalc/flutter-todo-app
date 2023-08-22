import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';

Column customTitleColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        AppLanguagesConstants.appListTitle,
        style: AppStylesConstants.headLineStyle1,
      ),
      Text(
        AppLanguagesConstants.appListSubTitle,
        style: AppStylesConstants.headLineStyle3,
      ),
    ],
  );
}