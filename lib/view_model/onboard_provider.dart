import 'package:flutter/material.dart';
import 'package:my_application/enum/shared_key.dart';
import 'package:my_application/models/onboard_items.dart';
import 'package:my_application/models/onboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardProvider extends ChangeNotifier {
  static SharedPreferences? _sharedPreferencesObj;
  final List<OnboardModel> items = OnboardItems().screens;
  int _isViewed = 0;

  int get isViewed => _isViewed;

  void toggleStatusViewed() {
    _isViewed = 1;
    saveViewedStatusToSharedPref(_isViewed);
    notifyListeners();
  }

  Future<void> createPrefObj() async {
    _sharedPreferencesObj = await SharedPreferences.getInstance();
  }

  void saveViewedStatusToSharedPref(int status) {
    _sharedPreferencesObj?.setInt(SharedKeys.onBoard.name, status);
  }

  void loadFromSharedPreferences() {
    _isViewed = _sharedPreferencesObj?.getInt(SharedKeys.onBoard.name) ?? 0;
  }
}
