import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String language='ar';
  void changeLanguage(String lang){
    language= lang;
    notifyListeners();
  }
}