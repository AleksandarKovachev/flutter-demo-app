import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/nuber_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_app/features/nuber_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_app/features/nuber_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_app/features/nuber_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:meta/meta.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      Future<NumberTriviaModel> Function() getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        NumberTriviaModel remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(
            NumberTrivia(text: remoteTrivia.text, number: remoteTrivia.number));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(
            NumberTrivia(text: localTrivia.text, number: localTrivia.number));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
