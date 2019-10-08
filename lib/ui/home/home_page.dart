import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/service/post_api_service.dart';
import 'package:flutter_app/data/moor_database.dart';
import 'package:flutter_app/data/moor_database.dart' as prefix0;
import 'package:flutter_app/data/new_post_input.dart';
import 'package:flutter_app/features/nuber_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter_app/model/built_post.dart';
import 'package:flutter_app/translations.dart';
import 'package:flutter_app/ui/settings/settings_page.dart';
import 'package:provider/provider.dart';

import '../../data/single_post_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text('app_title')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: Translations.of(context).text('settings'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ));
            },
          )
        ],
      ),
      body: _selectedIndex == 0 ? NumberTriviaPage() : _buildPostPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office),
            title: Text('Post'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newPost = BuiltPost((b) => b
            ..title = 'New Title'
            ..body = 'New Body');
          await Provider.of<PostApiService>(context).postPost(newPost);
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildPostPage() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NewPostInput(),
          _buildPostList(context),
          _buildBody(context),
        ],
      ),
    );
  }

  StreamBuilder<List<prefix0.Post>> _buildPostList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.postDao.watchAllPosts(),
      builder: (context, AsyncSnapshot<List<prefix0.Post>> snapshot) {
        final posts = snapshot.data ?? List();
        if (posts.isEmpty) {
          return Text('No items from the database!');
        }
        return ListView.builder(
          itemCount: posts.length,
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(posts[index].body),
                onTap: () => _navigateToPost(
                  context,
                  posts[index].id,
                ),
              ),
            );
          },
        );
      },
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response<BuiltList<BuiltPost>>>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          final posts = snapshot.data.body;
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, BuiltList<BuiltPost> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body),
            onTap: () => _navigateToPost(
              context,
              posts[index].id,
            ),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SinglePostPage(postId: id),
      ),
    );
  }
}
