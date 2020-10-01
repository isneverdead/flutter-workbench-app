import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: RaisedButton(
          onPressed: () {
            _authenticate('akbarr@gmail.com', 'qwertyuiop');
            // _register(
            //     email: 'akbarr@gmail.com',
            //     password: 'qwertyuiop',
            //     username: 'akbarr');
          },
          child: Text('Press ME'),
        )),
      ),
    );
  }

  static const uri = 'http://81bb539ce986.ngrok.io';
  Future<void> _register(
      {String email, String password, String username}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      // 'Accept': 'application/json',
    };
    const url = '$uri/api/register';
    try {
      print(' registering :  $email , name $username, pass: $password');
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: json.encode(
          {'email': email, 'name': username, 'password': password},
        ),
      );
      // print(response.body);
      final responseData = json.decode(response.body);
      print(responseData);
      // _token = responseData['data']['token'];
      // print('token ========= $_token');
      // final prefs = await SharedPreferences.getInstance();

      // prefs.setString('userData', _token);

      // notifyListeners();
      // if (responseData['email'] != null) {
      // }
      print(responseData);
      print('token  = ${responseData['data']['token']}');
      print('============Registered============');
    } catch (error) {
      throw error;
    }
  }

  Future<void> _authenticate(String username, String password) async {
    const url = '$uri/api/login';
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      // 'Accept': 'application/json',
    };
    try {
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: json.encode(
          {
            'email': username,
            // 'username': username,
            'password': password,
          },
        ),
      );
      // print('email from login page = $email');
      // print('== Login Response : ${response.body} ==');
      final responseData = json.decode(response.body);
      if (responseData['status'] == 1) {
        print(responseData['data']['token']);
      } else {
        print(responseData['error']);
      }
      // final data = jsonEncode({
      //   'token': responseData['data']['token'],
      //   'username': responseData['data']['user']['username'],
      //   'name': responseData['data']['user']['name'],
      //   'email': responseData['data']['user']['email'],
      //   'photoUrl': responseData['data']['user']['avatar'],
      // });
      // _token = responseData;
      // print('token ; $_token');

      // final extractedUserData = prefs.getString('userData');
      // // print(extractedUserData);
      // print('Token Key : ' + extractedUserData.toString());
      print('============Logged In============');
    } catch (error) {
      throw error;
    }
  }
}
