import 'package:chopper/chopper.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/service/trivia_number_service.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/built_number_trivia_model.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_app/features/nuber_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTrivia> getConcreteNumberTrivia(int number);

  Future<NumberTrivia> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final TriviaNumberService service;

  NumberTriviaRemoteDataSourceImpl({@required this.service});

  @override
  Future<NumberTrivia> getConcreteNumberTrivia(int number) async {
    return await _getTrivia(() {
      return service.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<NumberTrivia> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return service.getRandomNumberTrivia();
    });
  }

  Future<NumberTrivia> _getTrivia(
      Future<Response<BuiltNumberTriviaModel>> Function()
          getConcreteOrRandom) async {
    final response = await getConcreteOrRandom();
    if (response.isSuccessful && response.body != null) {
      return Future.value(NumberTriviaModel(
        text: response.body.text,
        number: response.body.number,
      ));
    } else {
      throw ServerException(message: 'Request error!');
    }
  }
}
