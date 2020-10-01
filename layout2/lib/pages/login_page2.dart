import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layout2/pages/home_page.dart';
import 'package:layout2/widgets/splash.dart';
import 'register_page.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;
import 'dart:convert' show json;

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '55973274659-4gjcsn192r2ohgg9rop4i0he0u0n1hg9.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _initValue = true;

  GoogleSignInAccount _currentUser;
  String _contactText;
  String _googleCurrentResult;
  String _googleUserToken;
  String _googleUserName;
  String _googleUserId;
  String _googleUserEmail;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      // print(account.authentication.then((value) => value.accessToken));
      print(' nameeeeeeeeeeeeeeee $_googleUserName');
      setState(() {
        _currentUser = account;
        _googleUserName = _currentUser.displayName;

        _googleUserEmail = _currentUser.email;
      });
      if (_currentUser != null) {
        _getToken();
      }
      // print(_googleUserName);
      print(_googleUserEmail);
      print(_googleUserName);
      print(' Token atas :  $_googleUserToken');
    });

    _googleSignIn.signInSilently();

    // _currentUser.authentication.then((value) => {print(value.accessToken)});
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn().then((result) {
        print('signInWithGoogle');
        result.authentication
            .then((value) => _googleUserToken = value.accessToken);
        print(result);
        print(_googleUserToken);
        return Provider.of<Auth>(context).signup(
          email: result.email,
          username: result.displayName,
          password: _googleUserToken,
        );
      });

      // final googleUser = await _currentUser;

      // print(_googleUserToken);
      // print(_googleUserName);
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOutGoogle() => _googleSignIn.disconnect();
  Future<void> _getToken() async {
    print(_googleUserName);
    print(_googleUserEmail);
    print(' Token  bawah :  $_googleUserToken');
  }

  @override
  void _showPassword() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: _highDevice,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: _4highDevice),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: _4highDevice * 0.8,
                    child: Image.network('https://tstng.co/images/testing.png'),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: _2highDevice * 0.8,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color: Colors.white,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: _2highDevice * 0.8,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isPasswordHidden,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 5,
                                color: Colors.white,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: _2highDevice * 0.8,
                    child: ButtonTheme(
                      minWidth: _4highDevice * 0.2,
                      height: _4highDevice * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterPage.routeName);
                            },
                            child: Text('Buat akun',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                          RaisedButton(
                            // padding: EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.white,
                            onPressed: () {
                              print('login presseed');
                              auth.login(_emailController.text,
                                  _passwordController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => SplashScreen(
                                            loadingTime: 3000,
                                            mode: 'login',
                                          )));
                              // Scaffold.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text(
                              //       'Added item to cart!',
                              //     ),
                              //     duration: Duration(seconds: 2),
                              //     action: SnackBarAction(
                              //       label: 'UNDO',
                              //       onPressed: () {
                              //         // cart.removeSingleItem(product.id);
                              //       },
                              //     ),
                              //   ),
                              // );
                              // Navigator.of(context)
                              //     .pushNamed(HomePage.routeName);
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: _4highDevice * 0.15)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Text(_currentUser.displayName != null
                  //     ? _currentUser.displayName
                  //     : 'no user'),
                  RaisedButton(
                    child: Text('sign in with google'),
                    onPressed: () {
                      signInWithGoogle().whenComplete(() {
                        // auth.login(_googleUserEmail, _googleUserToken);
                        auth
                            .signup(
                                email: auth.account.email,
                                password: auth.googleAuth.accessToken,
                                username: auth.account.displayName)
                            .whenComplete(() => {
                                  Timer(Duration(milliseconds: 5000), () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => SplashScreen(
                                                  loadingTime: 3000,
                                                  mode: 'login',
                                                )));
                                  })
                                });
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('Sign Out'),
                    onPressed: () {
                      signOutGoogle();
                    },
                  ),
                  FlatButton(
                    onPressed: () async {
                      await _getToken();
                      print('getting token');
                    },
                    child: Text('Lupa password?',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
