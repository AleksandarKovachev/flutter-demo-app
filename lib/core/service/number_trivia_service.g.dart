// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NumberTriviaService implements NumberTriviaService {
  _NumberTriviaService(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'http://numbersapi.com';

  @override
  getConcreteNumberTrivia(number) async {
    ArgumentError.checkNotNull(number, 'number');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$number?json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NumberTriviaModel.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getRandomNumberTrivia() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/random?json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NumberTriviaModel.fromJson(_result.data);
    return Future.value(value);
  }
}
