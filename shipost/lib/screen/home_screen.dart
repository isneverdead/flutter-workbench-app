import 'package:flutter/material.dart';
import '../widget/posts_widget.dart';
import '../widget/new_post.dart';
import '../widget/edit_post.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';
import '../providers/auth.dart';
import '../screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  void _startAddNewPost(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewPost(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _startEditPost(BuildContext ctx, String id) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: EditPost(id),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final posts = Provider.of<Posts>(context);
    final auth = Provider.of<Auth>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      auth.logout();
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    }),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                  child: Text(
                    'Shipost',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.edit),
                //   onPressed: () {
                //     // _editedPost = post.findById('36');
                //     // _post = _editedPost.values.toList()[0].content;
                //     // print('$_post');
                //     // Navigator.of(context)
                //     //     .pushNamed(EditPostCard.routeName, arguments: '$_post');
                //     // _startEditPost(context);
                //   },
                // )
              ],
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: RefreshIndicator(
          onRefresh: () => posts.fetchPost(),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
                  height: deviceSize.height * 0.8,
                  child: Container(
                    // padding: EdgeInsets.all(20),
                    child: PostsWidget(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          // onPressed: () => _startEditPost(context, 'idddddddd'),
          onPressed: () => _startAddNewPost(context),
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
