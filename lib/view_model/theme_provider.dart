import 'package:flutter/material.dart';
import 'package:my_application/product/themes/blue_theme.dart';
import 'package:my_application/product/themes/dark_theme.dart';
import 'package:my_application/product/themes/green_theme.dart';
import 'package:my_application/product/themes/light_theme.dart';
import 'package:my_application/product/themes/orange_theme.dart';
import 'package:my_application/product/themes/pink_theme.dart';
import 'package:my_application/product/themes/purple_theme.dart';
import 'package:my_application/product/themes/red_theme.dart';
import 'package:my_application/product/themes/yellow_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static SharedPreferences? _sharedPreferencesObj;
  ThemeData _selectedTheme = lightTheme();
  int _themeNumber = 8;

  final Map<int, ThemeData> _themes = {
    1: redTheme(),
    2: orangeTheme(),
    3: yellowTheme(),
    4: greenTheme(),
    5: blueTheme(),
    6: purpleTheme(),
    7: pinkTheme(),
    8: lightTheme(),
    9: darkTheme(),
  };

  int get themeNumber => _themeNumber;
  ThemeData get selectedTheme => _selectedTheme;

  void whichThemes(int index) {
    _selectedTheme = _themes[index] ?? lightTheme();
    saveThemeToSharedPreferences(index);
    notifyListeners();
  }

  Future<void> createPrefObj() async {
    _sharedPreferencesObj = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPreferences(int index) {
    _sharedPreferencesObj?.setInt('selectedTheme', index);
  }

  void loadFromSharedPreferences() {
    _themeNumber = _sharedPreferencesObj?.getInt('selectedTheme') ?? 8;
    _selectedTheme = _themes[_themeNumber] ?? lightTheme();
  }
}
