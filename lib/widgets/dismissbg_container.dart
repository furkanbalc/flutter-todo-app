import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_icon_constants.dart';
import 'package:my_application/product/constants/app_padding_constants.dart';

Container dismissBgContainer() {
  return Container(
      margin: AppPaddingConstants.ltbrPadding,
      decoration: BoxDecoration(
        color: AppColorConstants.redColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: AppPaddingConstants.horizontal20Padding,
      alignment: AlignmentDirectional.centerStart,
      child: AppIconConstants.deleteIcon);
}
