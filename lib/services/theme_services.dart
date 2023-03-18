import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {

  final GetStorage _box= new GetStorage();
  final _kay = 'darkMode';
  _saveThemeToBox( bool isDarkMode){
    _box.write(_kay, isDarkMode);
  }
  bool _loadThemeFromBox(){
    return _box.read<bool>(_kay)??false;

  }

  ThemeMode get theme =>_loadThemeFromBox()?ThemeMode.dark: ThemeMode.light;
  void swithTheme(){
    Get.changeThemeMode(_loadThemeFromBox()? ThemeMode.light:ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

}
