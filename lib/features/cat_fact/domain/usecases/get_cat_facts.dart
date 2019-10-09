import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';
import 'package:flutter_app/features/cat_fact/domain/repositories/cat_fact_repository.dart';

class GetCatFacts implements UseCase<List<CatFact>, NoParams> {
  final CatFactRepository repository;

  GetCatFacts(this.repository);

  @override
  Future<Either<Failure, List<CatFact>>> call(NoParams params) async {
    return await repository.getCatFacts();
  }
}
