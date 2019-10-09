import 'package:chopper/chopper.dart';
import 'package:flutter_app/core/built_value_converter.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/built_number_trivia_model.dart';

part 'number_trivia_service.chopper.dart';

@ChopperApi()
abstract class NumberTriviaService extends ChopperService {
  @Get(path: '/{number}?json')
  Future<Response<BuiltNumberTriviaModel>> getConcreteNumberTrivia(
      @Path('number') int number);

  @Get(path: '/random?json')
  Future<Response<BuiltNumberTriviaModel>> getRandomNumberTrivia();

  static NumberTriviaService create() {
    final client = ChopperClient(
      baseUrl: 'http://numbersapi.com',
      services: [
        _$NumberTriviaService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$NumberTriviaService(client);
  }
}
