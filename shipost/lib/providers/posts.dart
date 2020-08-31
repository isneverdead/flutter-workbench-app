import 'package:flutter/material.dart';
// import '../widgets/new_post.dart';
import './post.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './auth.dart';

class Posts with ChangeNotifier {
  Map<String, Post> _lists = {
    // "1": Post(
    //   id: 1.toString(),
    //   content:
    //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    //   username: 'isneverdead',
    // ),
    // "2": Post(
    //   id: 'dua',
    //   content:
    //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    //   username: 'isneverdead 2',
    // ),
  };

  final String authToken;
  Posts(this.authToken);
  Map<String, Post> get lists {
    // print('auth token provider : ' + authToken);
    print('============Lists.length : ${_lists.length} ============');
    return {..._lists};
  }

  // Future<String> getUsername(String userId) async {
  //   final url = 'http://goapp.iniakbar.xyz/api/users/';
  //   try {
  //     final response = await http.get(url);
  //     final userListData = json.decode(response.body);
  //     List<String> userList = [];
  //     userListData.forEach((i, user) {
  //       // print(user);
  //       userList.add(user.toString());
  //     });
  //     print(userList);
  //     userList.where((element) => element['id']);
  //   } catch (err) {
  //     throw (err);
  //   }

  //   return null;
  // }
  Map<String, Post> findById(String id) {
    // loadedPostById.putIfAbsent(key, () => null)
    Map<String, Post> loadedPostById = {};
    // lists.removeWhere((key, value) => key != id);
    lists.forEach((key, value) {
      if (key == id) {
        loadedPostById.putIfAbsent(
            '${value.id}',
            () => Post(
                content: value.content,
                id: value.id,
                username: value.username));
      }
    });
    // print(loadedPostById.keys);

    return loadedPostById;
  }

  Future<void> editPost(String id, String post) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    print('============Edit Post Excecuted -> id : $id ============');

    try {
      final response = await http.put(
        'http://goapp.iniakbar.xyz/api/post/$id',
        headers: headers,
        body: json.encode({
          'content': post,
        }),
      );
      print('============Edited Post -> id : $id ============');
      print(response.body);
    } catch (err) {
      throw (err);
    }
  }

  Future<void> fetchPost() async {
    final url = 'http://goapp.iniakbar.xyz/api/posts';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body)['data'];
      if (extractedData == null) {
        return;
      }
      // print(extractedData);
      final Map<String, Post> loadedPost = {};
      for (var item in extractedData) {
        loadedPost.putIfAbsent(
            '${item['id']}',
            // '${item['id']}${item['user_id']}',
            () => Post(
                id: item['id'].toString(),
                content: item['content'],
                username: item['user_id'].toString()));
      }

      _lists = loadedPost;
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<void> addPost(String key, Post post) async {
    const url = 'http://goapp.iniakbar.xyz/api/post';
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    try {
      final response = await http.post(url,
          headers: headers,
          body: json.encode({
            // 'id': key,
            // 'username': auth.username,
            'content': post.content,
          }));
      print(response.body);
    } catch (err) {
      print(err);
    }
    _lists.putIfAbsent(key, () => post);
    print(_lists.length);
    notifyListeners();
  }

  Future<void> removePost(String key) async {
    // final url = 'http://goapp.iniakbar.xyz/api/post/';
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
    try {
      print('============Delete Post -> id : $key ============');
      final response = await http
          .delete('http://goapp.iniakbar.xyz/api/post/$key', headers: headers);

      // notifyListeners();
      _lists.remove(key);
      print('============Lists Length -> ${_lists.length} ============');

      // print(_lists.length);
      notifyListeners();
      print(response);
    } catch (err) {
      throw (err);
    }
  }
}
