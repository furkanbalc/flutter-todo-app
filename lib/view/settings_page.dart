import 'package:flutter/material.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/product/constants/app_padding_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';
import 'package:my_application/widgets/custom_theme_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLanguagesConstants.appSettingsTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: AppPaddingConstants.allPadding,
            child: Card(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              child: Padding(
                padding: AppPaddingConstants.allPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLanguagesConstants.appThemeTitle,
                      style: AppStylesConstants.textStyle,
                    ),
                    const CustomThemeWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
