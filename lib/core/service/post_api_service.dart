import 'package:flutter_app/model/post_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'post_api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostApiService {
  factory PostApiService(Dio dio) = _PostApiService;

  @GET('/posts')
  Future<List<PostModel>> getPosts();

  @GET('/{id}')
  Future<PostModel> getPost(@Path('id') int id);

  @POST('/posts')
  Future<PostModel> postPost(@Body() PostModel body);

}
