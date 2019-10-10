import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_app/core/built_value_converter.dart';
import 'package:flutter_app/features/animal_image/data/models/animal_image_model.dart';

part 'animal_image_service.chopper.dart';

@ChopperApi()
abstract class AnimalImageService extends ChopperService {
  @Get(path: 'https://random.dog/woof.json')
  Future<Response> getDogImage();

  @Get(path: 'https://randomfox.ca/floof/')
  Future<Response> getFoxImage();

  @Get(path: 'https://api.thecatapi.com/v1/images/search')
  Future<Response> getCatImage();

  static AnimalImageService create() {
    final client = ChopperClient(
      services: [
        _$AnimalImageService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$AnimalImageService(client);
  }
}
