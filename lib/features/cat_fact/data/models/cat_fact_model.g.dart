// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFactModel _$CatFactModelFromJson(Map<String, dynamic> json) {
  return CatFactModel(
    json['id'] as String,
    json['text'] as String,
  );
}

Map<String, dynamic> _$CatFactModelToJson(CatFactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
