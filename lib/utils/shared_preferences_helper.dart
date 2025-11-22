// todo:save theme
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const String themeKey = 'themeKey';
  static const String languageKey = 'langKey';
}

Future<void> saveLastTheme(String newTheme) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(SharedPreferencesKeys.themeKey, newTheme);
}

Future<String> getLastTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String lastTheme = prefs.getString(SharedPreferencesKeys.themeKey) ?? "light";
  return lastTheme;
}

Future<void> saveLastLang(String newLang) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(SharedPreferencesKeys.languageKey, newLang);
}

Future<String> getLastLang() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String lastLang =
      prefs.getString(SharedPreferencesKeys.languageKey) ?? "light";
  return lastLang;
}
