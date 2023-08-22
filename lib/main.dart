import 'package:flutter/material.dart';
import 'package:my_application/models/items_data.dart';
import 'package:my_application/models/onboard_data.dart';
import 'package:my_application/models/themes_data.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/view/home_page.dart';
import 'package:my_application/view/welcome_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ItemsData().createPrefObject();
  await ThemesData().createPrefObj();
  await OnBoardData().createPrefObj();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemsData>(
          create: (BuildContext context) => ItemsData(),
        ),
        ChangeNotifierProvider<ThemesData>(
          create: (BuildContext context) => ThemesData(),
        ),
        ChangeNotifierProvider<OnBoardData>(
          create: (BuildContext context) => OnBoardData(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<ItemsData, ThemesData, OnBoardData>(
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
