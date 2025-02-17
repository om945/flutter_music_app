import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/themepage.dart/dark_mode.dart';
import 'package:flutter_application_1/pages/themepage.dart/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = LightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }


  void toggleTheme(){
    if(_themeData == LightMode){
      themeData = DarkMode;
    }else{
      themeData = LightMode;
    }
  }
}