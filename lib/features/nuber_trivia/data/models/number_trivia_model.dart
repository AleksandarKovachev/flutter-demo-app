import 'package:flutter_app/features/nuber_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

const TRIVIA_TEXT = 'TRIVIA_TEXT';
const TRIVIA_NUMBER = 'TRIVIA_NUMBER';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);
}
