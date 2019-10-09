import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CatFactState extends Equatable {
  const CatFactState(List props) : super();
}

class Empty extends CatFactState {
  Empty() : super(null);

  @override
  List<Object> get props => [];
}

class Loading extends CatFactState {
  Loading() : super(null);

  @override
  List<Object> get props => [];
}

class Loaded extends CatFactState {
  final List<CatFact> catFacts;

  Loaded({@required this.catFacts}) : super(catFacts);

  @override
  List<Object> get props => catFacts;
}

class Error extends CatFactState {
  final String message;

  Error({@required this.message}) : super([message]);

  @override
  List<Object> get props => [message];
}
