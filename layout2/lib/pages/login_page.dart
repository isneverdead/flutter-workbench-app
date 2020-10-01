import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layout2/pages/home_page.dart';
import 'package:layout2/pages/reset_password_page.dart';
import 'package:layout2/widgets/splash.dart';
import 'register_page.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/my_icons.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  bool _isSignInGoogleLoading = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _tokenCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('userDataToken').length > 1) {
      //
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => HomePage()));
    }
    print('============');
    print(prefs.getString('userDataToken'));
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          color: Colors.transparent,
          height: _highDevice,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: _4highDevice * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: _4highDevice * 0.25),
                    Container(
                      margin: EdgeInsets.only(bottom: _4highDevice * 0.1),
                      height: _4highDevice,
                      width: _4highDevice,
                      decoration: BoxDecoration(
                        // color: Colors,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(iconsLogin),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: _4highDevice * 0.15),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: _4highDevice,
                      height: 2,
                      color: Color(0xffBACFEB),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 1,
                                spreadRadius: 0.5),
                          ]),
                      width: _2highDevice * 0.8,
                      height: _4highDevice * 0.25,
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Username'),
                      ),
                    ),
                    SizedBox(height: _4highDevice * 0.15),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 1,
                                spreadRadius: 0.5),
                          ]),
                      width: _2highDevice * 0.8,
                      height: _4highDevice * 0.25,
                      child: TextField(
                        obscureText: _isPasswordHidden,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: _2highDevice * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _4highDevice * 0.7,
                            height: _4highDevice * 0.15,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterPage.routeName);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                'Registrasi',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: _4highDevice * 0.07,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: _4highDevice * 0.7,
                            height: _4highDevice * 0.15,
                            child: FlatButton(
                              // color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ResetPasswordPage.routeName);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                'Lupa kata sandi',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: _4highDevice * 0.07,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: _2highDevice * 0.8,
                      height: _4highDevice * 0.25,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          auth.login(_usernameController.text,
                              _passwordController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => SplashScreen(
                                        loadingTime: 3000,
                                        mode: 'login',
                                      )));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: _4highDevice * 0.09,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      width: _2highDevice * 0.8,
                      child: Text(
                        'Atau masuk dengan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: _4highDevice * 0.07,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: _2highDevice * 0.8,
                      height: _4highDevice * 0.25,
                      child: Tooltip(
                        message: 'Anda gabut? ',

                        // waitDuration: Duration(milliseconds: 200),
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            auth.googleSignIn().whenComplete(() =>
                                Future.delayed(Duration(milliseconds: 500), () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => SplashScreen(
                                                loadingTime: 3000,
                                                mode: 'login',
                                              )));
                                }));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: _4highDevice * 0.1,
                                  child: Image.asset(iconsGoogle)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: _4highDevice * 0.07,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
