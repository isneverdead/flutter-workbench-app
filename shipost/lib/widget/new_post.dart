import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';
import '../providers/post.dart';
import '../providers/auth.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();

  // var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Posts>(context);
    final auth = Provider.of<Auth>(context);

    return SingleChildScrollView(
      child: Card(
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
                  fillColor: Theme.of(context).primaryColor,
                  filled: true,
                  hintText: 'Katakan Sesuatu',
                  hintStyle: TextStyle(color: Colors.white),
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
                    child: Text(
                      'Post',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: _titleController.text.length > 10
                    ? () {
                        post.addPost(
                          _titleController.text,
                          Post(
                            id: _titleController.text,
                            content: _titleController.text,
                            username: auth.username,
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
