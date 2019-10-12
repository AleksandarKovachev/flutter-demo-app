import 'package:flutter_app/features/nuber_trivia/data/models/number_trivia_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'number_trivia_service.g.dart';

@RestApi(baseUrl: 'http://numbersapi.com')
abstract class NumberTriviaService {
  factory NumberTriviaService(Dio dio) = _NumberTriviaService;

  @GET('/{number}?json')
  Future<NumberTriviaModel> getConcreteNumberTrivia(
      @Path('number') int number);

  @GET('/random?json')
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
