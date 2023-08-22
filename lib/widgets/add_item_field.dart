import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';

class AddItemField extends StatelessWidget {
  const AddItemField({
    super.key,
    required TextEditingController addTfController,
  }) : _addTfController = addTfController;

  final TextEditingController _addTfController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 2,
      autofocus: true,
      onChanged: (value) {},
      controller: _addTfController,
      decoration: InputDecoration(
        labelText: AppLanguagesConstants.labelTask,
        hintText: AppLanguagesConstants.hintTask,
        hintStyle: TextStyle(
          color: AppColorConstants.textColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
