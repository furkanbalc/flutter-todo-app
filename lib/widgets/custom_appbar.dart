import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_icon_constants.dart';
import 'package:my_application/view/settings_page.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    // IconButton(
    //   onPressed: () {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       errorSnackBar(context),
    //     );
    //   },
    //   icon: AppIconConstants.menuIcon,
    // ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsPage()));
        },
        icon: AppIconConstants.settingsIcon,
      ),
    ],
  );
}
