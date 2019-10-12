// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_cat_fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCatFactModels _$AllCatFactModelsFromJson(Map<String, dynamic> json) {
  return AllCatFactModels(
    (json['all'] as List)
        ?.map((e) =>
            e == null ? null : CatFactModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AllCatFactModelsToJson(AllCatFactModels instance) =>
    <String, dynamic>{
      'all': instance.all,
    };
