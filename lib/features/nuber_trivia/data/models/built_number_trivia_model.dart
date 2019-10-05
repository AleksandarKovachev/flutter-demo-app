import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_number_trivia_model.g.dart';

const TRIVIA_TEXT = 'TRIVIA_TEXT';
const TRIVIA_NUMBER = 'TRIVIA_NUMBER';

abstract class BuiltNumberTriviaModel
    implements Built<BuiltNumberTriviaModel, BuiltNumberTriviaModelBuilder> {
  String get text;

  int get number;

  BuiltNumberTriviaModel._();

  factory BuiltNumberTriviaModel([updates(BuiltNumberTriviaModelBuilder b)]) =
      _$BuiltNumberTriviaModel;

  static Serializer<BuiltNumberTriviaModel> get serializer =>
      _$builtNumberTriviaModelSerializer;
}
