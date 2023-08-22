import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_color_constants.dart';

class AppStylesConstants {

  static TextStyle textStyle = const TextStyle(fontSize: 16,fontWeight: FontWeight.w500);
  static TextStyle appBarStyle = const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold);
  static const TextStyle headLineStyle1 = TextStyle(fontSize: 26, color: AppColorConstants.blackColor, fontWeight: FontWeight.bold);
  static const TextStyle headLineStyle2 = TextStyle(fontSize: 21, color: AppColorConstants.blackColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(fontSize: 17, color: AppColorConstants.greyShade500, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle4 = TextStyle(fontSize: 14, color: AppColorConstants.greyShade500, fontWeight: FontWeight.bold);

}