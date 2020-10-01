import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  Auth() {
    getGoogleProfile();
    getCurrentUserData();
  }

  PickedFile _userProfile;
  String _name = 'John Doe';
  String _email;
  String _username;
  // String _password;
  String _token;
  bool _isAdmin = false;
  String _photoUrl =
      'http://nwsid.net/wp-content/uploads/2015/05/dummy-profile-pic.png';

  var responseData;
  var response;
  var _userData;
  static const uri = 'http://9cd1e54dc762.ngrok.io';

  GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '55973274659-4gjcsn192r2ohgg9rop4i0he0u0n1hg9.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  String get photoUrl {
    return _photoUrl;
  }

  bool get isAdmin {
    return _isAdmin;
  }

  String get username {
    return _username;
  }

  String get name {
    return _name;
  }

  String get token {
    return _token;
  }

  String get email {
    return _email;
  }
  // Future<String> token() async {

  //   return
  // }

  GoogleSignInAccount _account;
  GoogleSignInAccount get account {
    return _account;
  }

  GoogleSignInAuthentication _googleAuth;
  GoogleSignInAuthentication get googleAuth {
    return _googleAuth;
  }

  bool gotProfile = false;
  Future<void> getCurrentUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('userToken');
    _username = prefs.getString('username');
    _name = prefs.getString('name');
    _email = prefs.getString('email');
    _photoUrl = prefs.getString('photoUrl');
    if (prefs.getBool('is_admin') != null) {
      _isAdmin = prefs.getBool('is_admin');
    } else {
      _isAdmin = true;
    }
    // _userData = jsonDecode(data);
    notifyListeners();
  }

  get userData {
    return _userData;
  }

  Future<void> getGoogleProfile() async {
    await _googleSignIn.signInSilently();
    _account = _googleSignIn.currentUser;
    if (_account != null) {
      _googleAuth = await _account.authentication;
      print('======== google auth =========');
      print('=== Token From Google > ${_googleAuth.accessToken}');
      gotProfile = true;
      _name = _account.displayName;
      _email = _account.email;
      if (_account.photoUrl != null) {
        _photoUrl = _account.photoUrl;
      }
      // final prefs = await SharedPreferences.getInstance();

      // prefs.setString('userData', _googleAuth.accessToken);
      notifyListeners();
    }
  }

  Future<void> googleSignIn() async {
    await logout();
    await _googleSignIn.signOut(); //optional
    GoogleSignInAccount user = await _googleSignIn.signIn();
    if (user == null) {
      print(' SIGN IN WITH GOOGLE FAILED');
    } else {
      print('SIGN IN GOOGLE success');
      getGoogleProfile().whenComplete(() {
        print('== Gooogle ID : ${_account.id}');
        Future.delayed(Duration(milliseconds: 1000), () {
          registerToLaravel(_account.displayName, _account.email,
              _googleAuth.accessToken, _account.id, _account.photoUrl);
        });
      });
      // Navigator.pushReplacementNamed(context, '/');
    }
  }

  Future<void> registerToLaravel(String username, String email, String password,
      String googleId, String photoUrl) async {
    const url = '$uri/api/login-google';
    await logout();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      response = await http.post(url,
          headers: requestHeaders,
          body: json.encode(
            {
              'email': email,
              // 'password': password,
              // 'name': username,
              // 'google_id': googleId,
            },
          ));
      responseData = json.decode(response.body);
      print('=== Login [Google to Laravel] : $responseData');
      if (response.statusCode == 200) {
        responseData = json.decode(response.body);

        final prefs = await SharedPreferences.getInstance();
        _token = responseData['data']['token'];
        // final data = jsonEncode({
        //   'token': _token,
        //   'username': username,
        //   'name': username,
        //   'email': email,
        //   'photoUrl': photoUrl,
        // });
        // prefs.setString('userData', data);
        prefs.setString('userToken', _token);
        prefs.setString('username', username);
        prefs.setString('name', username);
        prefs.setString('email', email);
        prefs.setString('photoUrl', photoUrl);
        // print('============Logging In [Google]============');

        notifyListeners();
      }
      print('==== Google Login > Account : $account');
      print('============Logged In [Google]============');
    } catch (e) {
      throw (e);
    }
  }

  void googleSignOut() async {
    // await _googleSignIn.disconnect();
    final prefs = await SharedPreferences.getInstance();
    if (_googleSignIn.currentUser != null) {
      await _googleSignIn.disconnect().whenComplete(() {
        print('==== Sign Out Success [Google]====');
        prefs.clear();
        prefs.remove('userToken');
        prefs.remove('username');
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('photoUrl');
      });
    }
    prefs.clear();
    prefs.remove('userToken');
    prefs.remove('username');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('photoUrl');
    prefs.clear();
    notifyListeners();

    // print('==== Sign Out Success ====');
  }

  Future<void> register(PickedFile userProfile, String name, String email,
      String username, String password) async {
    _userProfile = userProfile;
    _name = name;
    _email = email;
    _username = username;
    // _password = password;
    notifyListeners();
  }

  PickedFile get userProfile {
    return _userProfile;
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final data = jsonDecode(prefs.getString('userToken'));

    return data;
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
            // 'email': username,
            'username': username,
            'password': password,
          },
        ),
      );
      // print('email from login page = $email');
      // print('== Login Response : ${response.body} ==');
      final responseData = json.decode(response.body);
      if (responseData['status'] == 1) {
        print('=== Login [Biasa] token > ${responseData['data']['token']}');
        print(' === username :  ');
        print(responseData['data']);
      } else {
        print(' ERROR > ${responseData['error']}');
      }

      final prefs = await SharedPreferences.getInstance();

      // prefs.setString('userData', data);
      // is admin ?
      if (responseData['data']['user']['is_admin'] != null) {
        prefs.setBool('is_admin', true);
      } else {
        prefs.setBool('is_admin', false);
      }
      //
      prefs.setString('userToken', responseData['data']['token']);
      prefs.setString('username', responseData['data']['user']['username']);
      prefs.setString('name', responseData['data']['user']['name']);
      prefs.setString('email', responseData['data']['user']['email']);
      prefs.setString('photoUrl', responseData['data']['user']['avatar']);

      notifyListeners();
      // final extractedUserData = prefs.getString('userData');
      // // print(extractedUserData);
      // print('Token Key : ' + extractedUserData.toString());
      print('============Logged In [Biasa]============');
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    print('============Try Auto Login============');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userData') == null) {
      print('============Try Auto Login: False============');

      return false;
    }
    final extractedUserData = prefs.getString('userData');
    print('print dari tryAutoLogin :' + extractedUserData.toString());

    // print(extractedUserData);
    _token = extractedUserData;
    // _username = extractedUserData['username'];
    notifyListeners();
    print('============Try Auto Login: True============');
    return true;
  }

  Future<void> login(String email, String password) async {
    // print(isAuth);
    return _authenticate(email, password);
  }

  Future<void> _register(
      {String email, String password, String username}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      // 'Accept': 'application/json',
    };
    const url = '$uri/api/register';
    try {
      print(
          '==== Registering [Biasa] :  $email , name $username, pass: $password');
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: json.encode(
          {'email': email, 'name': username, 'password': password},
        ),
      );
      // print(response.body);
      final responseData = json.decode(response.body);
      print('== Response Register [Biasa] Body :  $responseData');
      if (responseData['data']['token'] != null) {
        print('token  = ${responseData['data']['token']}');
        print('============Registered [Biasa]============');
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup({String email, String password, String username}) async {
    // print(isAuth);
    return _register(email: email, password: password, username: username);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.remove('userToken');
    prefs.remove('username');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('photoUrl');
    notifyListeners();
  }
}
