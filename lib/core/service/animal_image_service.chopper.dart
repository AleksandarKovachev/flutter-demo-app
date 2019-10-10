// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_image_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AnimalImageService extends AnimalImageService {
  _$AnimalImageService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AnimalImageService;

  Future<Response> getDogImage() {
    final $url = 'https://random.dog/woof.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getFoxImage() {
    final $url = 'https://randomfox.ca/floof/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getCatImage() {
    final $url = 'https://api.thecatapi.com/v1/images/search';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
