import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';
import 'package:flutter_app/features/animal_image/domain/usecases/get_cat_image.dart';
import 'package:flutter_app/features/animal_image/domain/usecases/get_dog_image.dart';
import 'package:flutter_app/features/animal_image/domain/usecases/get_fox_image.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class AnimalImageBloc extends Bloc<AnimalImageEvent, AnimalImageState> {
  final GetDogImage getDogImage;
  final GetFoxImage getFoxImage;
  final GetCatImage getCatImage;

  AnimalImageBloc({
    @required GetDogImage getDogImage,
    @required GetFoxImage getFoxImage,
    @required GetCatImage getCatImage,
  })  : assert(getDogImage != null),
        assert(getFoxImage != null),
        assert(getCatImage != null),
        getDogImage = getDogImage,
        getFoxImage = getFoxImage,
        getCatImage = getCatImage;

  @override
  AnimalImageState get initialState => Empty();

  @override
  Stream<AnimalImageState> mapEventToState(
    AnimalImageEvent event,
  ) async* {
    yield Loading();
    Either<Failure, AnimalImage> failureOrAnimalImage;
    if (event is DogImage) {
      failureOrAnimalImage = await getDogImage(NoParams());
    } else if (event is FoxImage) {
      failureOrAnimalImage = await getFoxImage(NoParams());
    } else {
      failureOrAnimalImage = await getCatImage(NoParams());
    }
    yield* _eitherLoadedOrErrorState(failureOrAnimalImage);
  }

  Stream<AnimalImageState> _eitherLoadedOrErrorState(
    Either<Failure, AnimalImage> animalImage,
  ) async* {
    yield animalImage.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (animalImage) => Loaded(animalImage: animalImage),
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
}
