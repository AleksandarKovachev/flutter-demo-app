import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CatFact extends Equatable {
  final String id;
  final String text;

  CatFact({
    @required this.id,
    @required this.text,
  });

  @override
  List<Object> get props => [id, text];
}
