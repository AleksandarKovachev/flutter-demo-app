import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/service/post_api_service.dart';
import 'package:flutter_app/data/moor_database.dart';
import 'package:flutter_app/data/moor_database.dart' as prefix0;
import 'package:flutter_app/data/new_post_input.dart';
import 'package:flutter_app/features/animal_image/presentation/pages/animal_image_page.dart';
import 'package:flutter_app/features/cat_fact/presentation/pages/cat_fact_page.dart';
import 'package:flutter_app/features/nuber_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter_app/model/post_model.dart';
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scatter_plot),
            title: Text('Cat Facts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Animal Images'),
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
          await PostApiService(Dio())
              .postPost(PostModel(1, 'New Title', 'New Body'));
        },
      ),
    );
  }

  _buildBody(int selectedIndex) {
    if (selectedIndex == 0) {
      return NumberTriviaPage();
    } else if (selectedIndex == 1) {
      return CatFactPage();
    } else if (selectedIndex == 2) {
      return AnimalImagePage();
    } else {
      return _buildPostPage();
    }
  }

  _buildPostPage() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NewPostInput(),
          _buildPostList(context),
          _buildPostBody(context),
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

  FutureBuilder<List<PostModel>> _buildPostBody(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
      future: PostApiService(Dio()).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  snapshot.data[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(snapshot.data[index].body),
                onTap: () => _navigateToPost(
                  context,
                  snapshot.data[index].id,
                ),
              ),
            );
          },
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
