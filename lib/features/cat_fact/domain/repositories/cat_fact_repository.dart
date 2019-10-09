import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';

abstract class CatFactRepository {
  Future<Either<Failure, List<CatFact>>> getCatFacts();
}
