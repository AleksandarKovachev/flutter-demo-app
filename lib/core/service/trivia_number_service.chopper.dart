// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_number_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$TriviaNumberService extends TriviaNumberService {
  _$TriviaNumberService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = TriviaNumberService;

  Future<Response<BuiltNumberTriviaModel>> getConcreteNumberTrivia(int number) {
    final $url = '/${number}';
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
