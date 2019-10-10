import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/animal_image/data/datasources/animal_image_remote_data_source.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';
import 'package:flutter_app/features/animal_image/domain/repositories/animal_image_repository.dart';
import 'package:meta/meta.dart';

class AnimalImageRepositoryImpl implements AnimalImageRepository {
  final AnimalImageRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AnimalImageRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, AnimalImage>> getCatImage() async {
    return await _getAnimalImage(() {
      return remoteDataSource.getCatImage();
    });
  }

  @override
  Future<Either<Failure, AnimalImage>> getDogImage() async {
    return await _getAnimalImage(() {
      return remoteDataSource.getDogImage();
    });
  }

  @override
  Future<Either<Failure, AnimalImage>> getFoxImage() async {
    return await _getAnimalImage(() {
      return remoteDataSource.getFoxImage();
    });
  }

  Future<Either<Failure, AnimalImage>> _getAnimalImage(
      Future<AnimalImage> Function() getAnimalImage) async {
    if (await networkInfo.isConnected) {
      try {
        final animalImage = await getAnimalImage();
        return Right(animalImage);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
