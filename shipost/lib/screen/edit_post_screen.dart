import 'package:flutter/material.dart';
import '../providers/posts.dart';
import 'package:provider/provider.dart';
import '../providers/post.dart';

class EditPostScreen extends StatelessWidget {
  static const routeName = '/edit-post';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: Container(
        child:
            // Text('data'),
            EditPostCard(),
      ),
    );
  }
}

class EditPostCard extends StatefulWidget {
  @override
  _EditPostCardState createState() => _EditPostCardState();
}

class _EditPostCardState extends State<EditPostCard> {
  var _titleController = TextEditingController();
  // Map<String, Post> _editedPost = {};
  Map<String, Post> _initialValue = {};
  var editedValues = {
    'content': '',
    'username': '',
  };
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Posts>(context);
    final postId = ModalRoute.of(context).settings.arguments as String;
    _initialValue = post.findById(postId);
    _titleController = new TextEditingController(
        text: _initialValue.values.toList()[0].content);
    // print(_initialValue);
    // Map<String, Post> _editedPost = {
    //   '$postId':
    //       Post(id: '$postId', content: _titleController.text, username: 'testt')
    // };
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(
                height: 3,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelText: 'Katakan Sesuatu',
                fillColor: Theme.of(context).primaryColor,
                filled: true,
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: _titleController,
              onSubmitted: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text('Save')),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                post.editPost(postId, _titleController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
