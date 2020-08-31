import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';
import '../screen/edit_post_screen.dart';
import '../widget/edit_post.dart';

class PostsWidget extends StatelessWidget {
  final BuildContext contek;

  PostsWidget(this.contek);
  void _startEditPost(BuildContext ctx, String id) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            Navigator.of(ctx).pushNamed(EditPostScreen.routeName);
          },
          child: EditPost(id),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _goToEditScreen(BuildContext ctx, String id) {
    Navigator.of(ctx).pushNamed(EditPostScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context);

    return Container(
      // padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.lists.length,
              itemBuilder: (contex, index) => GestureDetector(
                onTap: () {
                  _goToEditScreen(
                      contek, posts.lists.values.toList()[index].id);
                },
                child: Dismissible(
                  onDismissed: (direction) {
                    // _goToEditScreen(
                    //     contek, posts.lists.values.toList()[index].content);
                    posts.removePost(posts.lists.values.toList()[index].id);
                    print(
                        '=== dimissed ${posts.lists.values.toList()[index].id}');
                  },
                  key: ValueKey(posts.lists.values.toList()[index].id),
                  child: Card(
                    elevation: 5,
                    child:
                        // GestureDetector(
                        //   onTap: () {
                        //     print('============ ${posts.lists.keys}');
                        //     _goToEditScreen(
                        //         contek, posts.lists.values.toList()[index].content);
                        //   },
                        //   child:
                        Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts.lists.values.toList()[index].username,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            posts.lists.values.toList()[index].content,
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
