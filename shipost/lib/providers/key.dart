import 'package:flutter/foundation.dart';

class Key with ChangeNotifier {
  final String key;
  final String content;

  Key({
    @required this.key,
    @required this.content,
  });
}
