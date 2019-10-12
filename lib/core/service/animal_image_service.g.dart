// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_image_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AnimalImageService implements AnimalImageService {
  _AnimalImageService(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  @override
  getDogImage() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'https://random.dog/woof.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra),
        data: _data);
    final value = AnimalImageModel.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getFoxImage() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'https://randomfox.ca/floof/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra),
        data: _data);
    final value = AnimalImageModel.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getCatImage() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'https://api.thecatapi.com/v1/images/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra),
        data: _data);
    var value = _result.data
        .map(
            (dynamic i) => AnimalImageModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }
}
