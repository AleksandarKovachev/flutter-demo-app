import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';
import 'package:flutter_app/features/cat_fact/domain/usecases/get_cat_facts.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final GetCatFacts getCatFacts;

  CatFactBloc({
    @required GetCatFacts getCatFacts,
  })  : assert(getCatFacts != null),
        getCatFacts = getCatFacts;

  @override
  CatFactState get initialState => Empty();

  @override
  Stream<CatFactState> mapEventToState(
    CatFactEvent event,
  ) async* {
    yield Loading();
    final failureOrCatFacts = await getCatFacts(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrCatFacts);
  }
}

Stream<CatFactState> _eitherLoadedOrErrorState(
  Either<Failure, List<CatFact>> failureOrCatFacts,
) async* {
  yield failureOrCatFacts.fold(
    (failure) => Error(message: _mapFailureToMessage(failure)),
    (catFacts) => Loaded(catFacts: catFacts),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
