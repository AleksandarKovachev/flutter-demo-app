import 'package:json_annotation/json_annotation.dart';

part 'cat_fact_model.g.dart';

@JsonSerializable()
class CatFactModel {
  final String id;
  final String text;

  CatFactModel(this.id, this.text);

  factory CatFactModel.fromJson(Map<String, dynamic> json) =>
      _$CatFactModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactModelToJson(this);

}
