import 'package:flutter_app/core/service/number_trivia_service.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/number_trivia_model.dart';
import 'package:meta/meta.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final NumberTriviaService service;

  NumberTriviaRemoteDataSourceImpl({@required this.service});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) {
    return service.getConcreteNumberTrivia(number);
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() {
    return service.getRandomNumberTrivia();
  }
}
