import 'package:flutter_app/features/nuber_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_app/shared_preferences_helper.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    return SharedPreferencesHelper.getLastNumberTrivia();
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return SharedPreferencesHelper.cacheNumberTrivia(triviaToCache);
  }
}
