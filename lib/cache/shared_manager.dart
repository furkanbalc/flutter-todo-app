import 'package:my_application/cache/shared_exception.dart';
import 'package:my_application/enum/shared_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  // shared objesi olusturur
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // obje olusturulmus mu diye kontrol eder
  void _checkPreferences() {
    if (preferences == null) throw SharedInitializeException();
  }

  // bool degerlerini sharedPreferencese kaydeder
  Future<void> saveBool(SharedKeys key, bool value) async {
    _checkPreferences();
    await preferences?.setBool(key.name, value);
  }

  // bool degerlerini sharedPreferences den ceker
  bool? getBool(SharedKeys key) {
    _checkPreferences();
    final bool value = preferences?.getBool(key.name) ?? false;
    return value;
  }

  // int degerlerini sharedPreferencese kaydeder
  Future<void> saveInt(SharedKeys key, int value) async {
    _checkPreferences();
    await preferences?.setInt(key.name, value);
  }

  // int degerlerini sharedPreferences den ceker
  int? getInt(SharedKeys key) {
    _checkPreferences();
    final int value = preferences?.getInt(key.name) ?? 0;
    return value;
  }

  // string list degerlerini sharedPreferences den ceker
  Future<void> saveStringList(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  // string list degerlerini sharedPreferences den ceker
  List<String>? getStringList(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(key.name);
  }
}
