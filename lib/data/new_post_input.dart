import 'package:flutter/material.dart';
import 'package:flutter_app/data/moor_database.dart';
import 'package:provider/provider.dart';

class NewPostInput extends StatefulWidget {
  @override
  _NewPostInputState createState() => _NewPostInputState();
}

class _NewPostInputState extends State<NewPostInput> {
  TextEditingController titleController;
  TextEditingController bodyController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    bodyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Post title'),
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(hintText: 'Post body'),
          ),
          FlatButton(
            child: Text('Submit'),
            color: Colors.blue,
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  bodyController.text.isNotEmpty) {
                final database = Provider.of<AppDatabase>(context);
                final post = Post(
                  title: titleController.text,
                  body: bodyController.text,
                  createdDate: DateTime.now(),
                );
                database.postDao.insertPost(post);
                resetValuesAfterSubmit();
              }
            },
          )
        ],
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      titleController.clear();
      bodyController.clear();
    });
  }
}
