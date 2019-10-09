import 'dart:convert';

import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/service/cat_fact_service.dart';
import 'package:flutter_app/features/cat_fact/data/models/cat_fact_model.dart';
import 'package:meta/meta.dart';

abstract class CatFactRemoteDataSource {
  Future<List<CatFactModel>> getCatFacts();
}

class CatFactRemoteDataSourceImpl implements CatFactRemoteDataSource {
  final CatFactService service;

  CatFactRemoteDataSourceImpl({@required this.service});

  @override
  Future<List<CatFactModel>> getCatFacts() async {
    final response = await service.getCatFacts();
    if (response.isSuccessful && response.body != null) {
      Map<String, dynamic> jsonResponse = json.decode(response.bodyString);
      List listResponse = jsonResponse['all'];
      return Future.value(listResponse
          .map((c) => CatFactModel(id: c['_id'], text: c['text']))
          .toList());
    } else {
      throw ServerException(message: 'Request error!');
    }
  }
}
