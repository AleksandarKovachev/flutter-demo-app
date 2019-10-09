import 'package:chopper/chopper.dart';
import 'package:flutter_app/core/built_value_converter.dart';

part 'cat_fact_service.chopper.dart';

@ChopperApi()
abstract class CatFactService extends ChopperService {
  @Get(path: '/')
  Future<Response> getCatFacts();

  static CatFactService create() {
    final client = ChopperClient(
      baseUrl: 'https://cat-fact.herokuapp.com/facts',
      services: [
        _$CatFactService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$CatFactService(client);
  }
}
