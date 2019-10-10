import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/service/animal_image_service.dart';
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
    return await _getAnimalImage(() {
      return service.getCatImage();
    });
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
      Future<Response> Function() getAnimalImage) async {
    final response = await getAnimalImage();
    if (response.isSuccessful && response.bodyString != null) {
      final decodedResponse = json.decode(response.bodyString);
      if (decodedResponse is List) {
        return _buildBody(decodedResponse[0], getAnimalImage);
      }
      return _buildBody(decodedResponse, getAnimalImage);
    } else {
      throw ServerException(message: 'Request error!');
    }
  }

  _buildBody(
      Map<String, dynamic> body, Future<Response> Function() getAnimalImage) {
    if (body['url'] != null && (body['url'] as String).contains('mp4')) {
      return _getAnimalImage(getAnimalImage);
    }
    return Future.value(
        AnimalImage(url: body['url'] != null ? body['url'] : body['image']));
  }
}
