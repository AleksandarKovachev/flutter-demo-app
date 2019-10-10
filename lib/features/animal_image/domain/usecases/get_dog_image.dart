import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';
import 'package:flutter_app/features/animal_image/domain/repositories/animal_image_repository.dart';

class GetDogImage implements UseCase<AnimalImage, NoParams> {
  final AnimalImageRepository repository;

  GetDogImage(this.repository);

  @override
  Future<Either<Failure, AnimalImage>> call(NoParams params) async {
    return await repository.getDogImage();
  }
}
