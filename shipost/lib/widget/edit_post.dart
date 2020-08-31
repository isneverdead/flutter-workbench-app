import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';
import '../providers/post.dart';

class EditPost extends StatefulWidget {
  final String id;
  EditPost(this.id);
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  var _titleController = TextEditingController();

  // var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    _titleController = new TextEditingController(text: widget.id);
    final post = Provider.of<Posts>(context);

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
                    child: Text('Post')),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  post.addPost(
                    _titleController.text,
                    Post(
                      id: _titleController.text,
                      content: _titleController.text,
                      username: "null",
                    ),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
