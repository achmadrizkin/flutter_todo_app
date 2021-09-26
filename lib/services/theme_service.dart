import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

/// save theme to storage for change theme
class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// read _key data (check if _key have data)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  
  /// check if _loadThemeFromBox have data, load to ThemeMode.dark.
  /// ThemeMode from utils
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  // call and check if _loadThemeFromBox true (true means _key have a data)
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}