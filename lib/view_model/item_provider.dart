import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_application/enum/shared_key.dart';
import 'package:my_application/models/item_model.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/product/constants/app_padding_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemProvider with ChangeNotifier {
  final List<ItemModel> _items = [];
  UnmodifiableListView<ItemModel> get items => UnmodifiableListView(_items);

  static SharedPreferences? _sharedPreferences;
  final List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();

    notifyListeners();

    saveItemsToSharedPreferences();
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(ItemModel(title: title));
    saveItemsToSharedPreferences();
    notifyListeners();
  }

  void undoItem(String title) {
    addItem(title);
  }

  void updateItem(int index, String title) {
    _items.remove(_items[index]);
    saveItemsToSharedPreferences();
    notifyListeners();
    addItem(title);
  }

  void deleteItem(int index, String title, BuildContext context) {
    _items.remove(_items[index]);
    saveItemsToSharedPreferences();
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: const Text(AppLanguagesConstants.appDeleted),
        width: 280.0,
        padding: AppPaddingConstants.horizontal8Padding,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        action: SnackBarAction(
          label: AppLanguagesConstants.appUndo,
          onPressed: () {
            addItem(title);
          },
        ),
      ),
    );
  }

  Future<void> createPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPreferences() {
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(jsonEncode(item.toMap()));
    }
    _sharedPreferences?.setStringList(SharedKeys.toDoData.name, _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String> tempList = _sharedPreferences?.getStringList(SharedKeys.toDoData.name) ?? [];

    _items.clear();
    for (var item in tempList) {
      _items.add(ItemModel.fromMap(jsonDecode(item)));
    }
  }
}
