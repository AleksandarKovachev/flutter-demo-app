// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CatFactService implements CatFactService {
  _CatFactService(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'https://cat-fact.herokuapp.com';

  @override
  getCatFacts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/facts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AllCatFactModels.fromJson(_result.data);
    return Future.value(value);
  }
}
