import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/features/nuber_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState(List props) : super();
}

class Empty extends NumberTriviaState {
  Empty() : super(null);

  @override
  List<Object> get props => [];
}

class Loading extends NumberTriviaState {
  Loading() : super(null);

  @override
  List<Object> get props => [];
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia}) : super([trivia]);

  @override
  List<Object> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error({@required this.message}) : super([message]);

  @override
  List<Object> get props => [message];
}
