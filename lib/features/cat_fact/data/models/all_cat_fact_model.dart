import 'package:json_annotation/json_annotation.dart';

import 'cat_fact_model.dart';

part 'all_cat_fact_model.g.dart';

@JsonSerializable()
class AllCatFactModels {
  List<CatFactModel> all;

  AllCatFactModels(this.all);

  factory AllCatFactModels.fromJson(Map<String, dynamic> json) =>
      _$AllCatFactModelsFromJson(json);

  Map<String, dynamic> toJson() => _$AllCatFactModelsToJson(this);
}
