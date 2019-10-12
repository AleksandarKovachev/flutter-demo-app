import 'package:json_annotation/json_annotation.dart';

part 'animal_image_model.g.dart';

@JsonSerializable()
class AnimalImageModel {
  final String url;

  final String image;

  AnimalImageModel(this.url, this.image);

  factory AnimalImageModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalImageModelToJson(this);

}
