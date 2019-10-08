// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$NumberTriviaService extends NumberTriviaService {
  _$NumberTriviaService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = NumberTriviaService;

  Future<Response<BuiltNumberTriviaModel>> getConcreteNumberTrivia(int number) {
    final $url = '/${number}?json';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<BuiltNumberTriviaModel, BuiltNumberTriviaModel>($request);
  }

  Future<Response<BuiltNumberTriviaModel>> getRandomNumberTrivia() {
    final $url = '/random?json';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<BuiltNumberTriviaModel, BuiltNumberTriviaModel>($request);
  }
}
