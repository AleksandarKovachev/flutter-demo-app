import 'package:dio/dio.dart';
import 'package:flutter_app/features/animal_image/data/models/animal_image_model.dart';
import 'package:retrofit/retrofit.dart';

part 'animal_image_service.g.dart';

@RestApi()
abstract class AnimalImageService {
  factory AnimalImageService(Dio dio) = _AnimalImageService;

  @GET('https://random.dog/woof.json')
  Future<AnimalImageModel> getDogImage();

  @GET('https://randomfox.ca/floof/')
  Future<AnimalImageModel> getFoxImage();

  @GET('https://api.thecatapi.com/v1/images/search')
  Future<List<AnimalImageModel>> getCatImage();
}
