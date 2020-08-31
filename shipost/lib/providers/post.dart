import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  final String id;
  final String username;
  final String content;

  Post({
    @required this.id,
    @required this.content,
    @required this.username,
  });
}
