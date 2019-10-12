// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberTriviaModel _$NumberTriviaModelFromJson(Map<String, dynamic> json) {
  return NumberTriviaModel(
    json['text'] as String,
    json['number'] as int,
  );
}

Map<String, dynamic> _$NumberTriviaModelToJson(NumberTriviaModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
    };
