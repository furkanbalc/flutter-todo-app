import 'package:flutter/material.dart';
import 'package:my_application/view_model/item_provider.dart';
import 'package:my_application/view_model/onboard_provider.dart';
import 'package:my_application/view_model/theme_provider.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/view/home_page.dart';
import 'package:my_application/view/welcome_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ItemProvider().createPrefObject();
  await ThemeProvider().createPrefObj();
  await OnboardProvider().createPrefObj();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemProvider>(create: (BuildContext context) => ItemProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (BuildContext context) => ThemeProvider()),
        ChangeNotifierProvider<OnboardProvider>(create: (BuildContext context) => OnboardProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<ItemProvider, ThemeProvider, OnboardProvider>(
      builder: (context, itemsData, themesData, onBoardData, child) {
        itemsData.loadItemsFromSharedPref();
        themesData.loadFromSharedPreferences();
        onBoardData.loadFromSharedPreferences();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppLanguagesConstants.appName,
          theme: themesData.selectedTheme,
          home: onBoardData.isViewed == 1 ? HomePage() : const WelcomePage(),
        );
      },
    );
  }
}
