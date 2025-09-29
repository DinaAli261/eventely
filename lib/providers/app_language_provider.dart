import 'package:evently/utils/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  AppLanguageProvider() {
    getLang();
  }

  String appLanguage = "en";
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void getLang() async {
    String lang = await getLastLang();
    appLanguage = lang;
    notifyListeners();
  }
}
