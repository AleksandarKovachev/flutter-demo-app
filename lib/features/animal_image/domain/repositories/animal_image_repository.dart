import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';

abstract class AnimalImageRepository {
  Future<Either<Failure, AnimalImage>> getDogImage();

  Future<Either<Failure, AnimalImage>> getFoxImage();

  Future<Either<Failure, AnimalImage>> getCatImage();
}
