import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AnimalImageEvent extends Equatable {
  const AnimalImageEvent() : super();
}

class DogImage extends AnimalImageEvent {
  DogImage();

  @override
  List<Object> get props => null;
}

class FoxImage extends AnimalImageEvent {
  FoxImage();

  @override
  List<Object> get props => null;
}

class CatImage extends AnimalImageEvent {
  CatImage();

  @override
  List<Object> get props => null;
}
