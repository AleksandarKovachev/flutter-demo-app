// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CatFactService extends CatFactService {
  _$CatFactService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CatFactService;

  Future<Response> getCatFacts() {
    final $url = '/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
