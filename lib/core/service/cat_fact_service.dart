import 'package:dio/dio.dart';
import 'package:flutter_app/features/cat_fact/data/models/all_cat_fact_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_fact_service.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
abstract class CatFactService {
  factory CatFactService(Dio dio) = _CatFactService;

  @GET('/facts')
  Future<AllCatFactModels> getCatFacts();
}
