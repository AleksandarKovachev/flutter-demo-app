import 'package:flutter_app/core/service/cat_fact_service.dart';
import 'package:flutter_app/features/cat_fact/data/models/all_cat_fact_model.dart';
import 'package:meta/meta.dart';

abstract class CatFactRemoteDataSource {
  Future<AllCatFactModels> getCatFacts();
}

class CatFactRemoteDataSourceImpl implements CatFactRemoteDataSource {
  final CatFactService service;

  CatFactRemoteDataSourceImpl({@required this.service});

  @override
  Future<AllCatFactModels> getCatFacts() {
    return service.getCatFacts();
  }
}
