import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent(List props) : super();
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString) : super([numberString]);

  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  GetTriviaForRandomNumber() : super(null);

  @override
  List<Object> get props => null;
}
