import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AnimalImageState extends Equatable {
  const AnimalImageState(List props) : super();
}

class Empty extends AnimalImageState {
  Empty() : super(null);

  @override
  List<Object> get props => [];
}

class Loading extends AnimalImageState {
  Loading() : super(null);

  @override
  List<Object> get props => [];
}

class Loaded extends AnimalImageState {
  final AnimalImage animalImage;

  Loaded({@required this.animalImage}) : super([animalImage]);

  @override
  List<Object> get props => [animalImage];
}

class Error extends AnimalImageState {
  final String message;

  Error({@required this.message}) : super([message]);

  @override
  List<Object> get props => [message];
}
