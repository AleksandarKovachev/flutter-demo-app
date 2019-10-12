import 'package:flutter_app/core/service/animal_image_service.dart';
import 'package:flutter_app/features/animal_image/data/models/animal_image_model.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';
import 'package:meta/meta.dart';

abstract class AnimalImageRemoteDataSource {
  Future<AnimalImage> getDogImage();

  Future<AnimalImage> getFoxImage();

  Future<AnimalImage> getCatImage();
}

class AnimalImageRemoteDataSourceImpl implements AnimalImageRemoteDataSource {
  final AnimalImageService service;

  AnimalImageRemoteDataSourceImpl({@required this.service});

  @override
  Future<AnimalImage> getCatImage() async {
    final response = await service.getCatImage();
    return _buildBody(response[0], null);
  }

  @override
  Future<AnimalImage> getDogImage() async {
    return await _getAnimalImage(() {
      return service.getDogImage();
    });
  }

  @override
  Future<AnimalImage> getFoxImage() async {
    return await _getAnimalImage(() {
      return service.getFoxImage();
    });
  }

  Future<AnimalImage> _getAnimalImage(
      Future<AnimalImageModel> Function() getAnimalImage) async {
    return _buildBody(await getAnimalImage(), getAnimalImage);
  }

  _buildBody(AnimalImageModel body,
      Future<AnimalImageModel> Function() getAnimalImage) {
    if (body != null && body.url != null && body.url.contains('mp4')) {
      return _getAnimalImage(getAnimalImage);
    }
    return Future.value(
        AnimalImage(url: body.url != null ? body.url : body.image));
  }
}
