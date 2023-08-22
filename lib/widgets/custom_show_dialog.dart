import 'package:flutter/material.dart';
import 'package:my_application/widgets/add_item_field.dart';

Future<dynamic> customShowDialog({
  required BuildContext context,
  required TextEditingController tfController,
  required String buttonText,
  required VoidCallback? onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AddItemField(addTfController: tfController),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ],
      );
    },
  );
}
