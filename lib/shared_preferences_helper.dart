import 'package:shared_preferences/shared_preferences.dart';

const String IS_DARK_THEME = "IS_DARK_THEME";
const String SELECTED_LANGUAGE = "SELECTED_LANGUAGE";

class SharedPreferencesHelper {
  static Future<String> getSelectedLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(SELECTED_LANGUAGE) ?? 'en';
  }

  static setSelectedLanguage(String selectedLanguage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(SELECTED_LANGUAGE, selectedLanguage);
  }

  static Future<bool> getIsDarkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(IS_DARK_THEME) ?? true;
  }

  static setIsDarkTheme(bool isDarkTheme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(IS_DARK_THEME, isDarkTheme);
  }
}
