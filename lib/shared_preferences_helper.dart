import 'package:shared_preferences/shared_preferences.dart';

import 'core/error/exceptions.dart';
import 'features/nuber_trivia/data/models/number_trivia_model.dart';

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

  static Future<NumberTriviaModel> getLastNumberTrivia() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final text = sharedPreferences.getString(TRIVIA_TEXT);
    final number = sharedPreferences.getInt(TRIVIA_NUMBER);
    if (text.isNotEmpty && number != null) {
      return Future.value(NumberTriviaModel(text: text, number: number));
    } else {
      throw CacheException(message: 'Cache error!');
    }
  }

  static cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(TRIVIA_TEXT, triviaToCache.text);
    return sharedPreferences.setInt(TRIVIA_NUMBER, triviaToCache.number);
  }

}
