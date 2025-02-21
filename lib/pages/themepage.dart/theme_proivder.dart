import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/themepage.dart/dark_mode.dart';
import 'package:flutter_application_1/pages/themepage.dart/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  late ThemeData _themeData;
  late bool _isDarkMode;

  ThemeProvider() {
    _themeData = LightMode;
    _isDarkMode = false;
    _loadThemePreference();
  }

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(){
    if(_themeData == LightMode){
      _themeData = DarkMode;
      _isDarkMode = true;
    }else{
      _themeData = LightMode;
      _isDarkMode = false;
    }
    _saveThemePreference();
    notifyListeners();
  }
  
  _loadThemePreference() async{
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    if(isDarkMode){
      _themeData = DarkMode;
      _isDarkMode = true;
    }
    notifyListeners();
  }


  _saveThemePreference() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}