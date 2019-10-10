import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';
import 'package:meta/meta.dart';

class BuiltAnimalImageModel extends AnimalImage {
  BuiltAnimalImageModel({
    @required String url,
  }) : super(url: url);
}
