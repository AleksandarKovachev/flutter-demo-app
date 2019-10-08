import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/number_trivia_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final text = sharedPreferences.getString(TRIVIA_TEXT);
    final number = sharedPreferences.getInt(TRIVIA_NUMBER);
    if (text.isNotEmpty && number != null) {
      return Future.value(NumberTriviaModel(text: text, number: number));
    } else {
      throw CacheException(message: 'Cache error!');
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    sharedPreferences.setString(TRIVIA_TEXT, triviaToCache.text);
    return sharedPreferences.setInt(TRIVIA_NUMBER, triviaToCache.number);
  }
}
