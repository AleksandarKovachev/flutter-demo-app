import 'package:chopper/chopper.dart';
import 'package:flutter_app/data/built_value_converter.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/built_number_trivia_model.dart';

part 'trivia_number_service.chopper.dart';

@ChopperApi()
abstract class TriviaNumberService extends ChopperService {
  @Get(path: '/{number}')
  Future<Response<BuiltNumberTriviaModel>> getConcreteNumberTrivia(
      @Path('number') int number);

  @Get(path: '/random?json')
  Future<Response<BuiltNumberTriviaModel>> getRandomNumberTrivia();

  static TriviaNumberService create() {
    final client = ChopperClient(
      baseUrl: 'http://numbersapi.com',
      services: [
        _$TriviaNumberService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$TriviaNumberService(client);
  }
}
