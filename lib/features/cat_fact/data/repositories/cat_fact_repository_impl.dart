import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/cat_fact/data/datasources/cat_fact_remote_data_source.dart';
import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';
import 'package:flutter_app/features/cat_fact/domain/repositories/cat_fact_repository.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

class CatFactRepositoryImpl implements CatFactRepository {
  final CatFactRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CatFactRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CatFact>>> getCatFacts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCatFacts = await remoteDataSource.getCatFacts();
        return Right(
            remoteCatFacts.all.map((c) => CatFact(id: c.id, text: c.text)).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
