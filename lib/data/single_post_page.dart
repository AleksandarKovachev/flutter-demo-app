import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/service/post_api_service.dart';
import 'package:flutter_app/model/post_model.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage({
    Key key,
    this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chopper Blog'),
        ),
        body: FutureBuilder<PostModel>(
          future: PostApiService(Dio()).getPost(postId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildPost(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Padding _buildPost(PostModel post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            post.title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(post.body),
        ],
      ),
    );
  }
}
