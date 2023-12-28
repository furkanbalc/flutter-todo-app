import 'package:flutter/material.dart';
import 'package:my_application/view_model/item_provider.dart';
import 'package:my_application/product/constants/app_icon_constants.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/widgets/custom_error_snackbar.dart';
import 'package:my_application/widgets/custom_show_dialog.dart';
import 'package:provider/provider.dart';

FloatingActionButton customFab(BuildContext context, TextEditingController tfController) {
  return FloatingActionButton(
    onPressed: () {
      tfController.clear();
      customShowDialog(
        context: context,
        tfController: tfController,
        buttonText: AppLanguagesConstants.appAddItem,
        onPressed: () {
          if (tfController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar(context),
            );
          } else {
            Provider.of<ItemProvider>(context, listen: false).addItem(tfController.text);
            Navigator.pop(context);
          }
        },
      );
    },
    child: AppIconConstants.addIcon,
  );
}
