import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';
import 'package:meta/meta.dart';

class CatFactModel extends CatFact {
  CatFactModel({
    @required String id,
    @required String text,
  }) : super(id: id, text: text);
}
