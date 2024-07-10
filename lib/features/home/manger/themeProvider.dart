import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.dark;
  bool themeCheck=false;
  changeTheme(ThemeMode theme,bool check){
    themeMode= theme;
    themeCheck = check;
    notifyListeners();

  }
}