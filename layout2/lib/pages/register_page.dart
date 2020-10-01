import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layout2/pages/home_page.dart';
import 'package:layout2/widgets/splash.dart';
import 'login_page.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../styles/my_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordHidden = true;
  bool _isUserPhoto = false;
  bool _showConfirmPassword = false;
  bool _isPasswordMatch = false;
  bool _enableButton = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _watchPassword() {
    if (_passwordController.text == _confirmPasswordController.text) {
      setState(() {
        _isPasswordMatch = true;
      });
    } else {
      setState(() {
        _isPasswordMatch = false;
      });
    }
  }

  void _watchField() {
    if (_passwordController.text.length > 7 &&
        _usernameController.text.length != 0 &&
        _emailController.text.length != 0) {
      setState(() {
        _enableButton = true;
      });
    } else {
      setState(() {
        _enableButton = false;
      });
    }
  }

  void _showPassword() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  PickedFile userPhoto;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    final auth = Provider.of<Auth>(context);
    // bool _isPasswordHidden = false;

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
                    // SizedBox(height: _4highDevice * 0.25),
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
                      'Register',
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
                        onChanged: (value) => _watchField(),
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
                        onChanged: (value) => _watchField(),
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                    SizedBox(height: _4highDevice * 0.15),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 5),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _2highDevice * 0.55,
                            child: TextField(
                              onChanged: (value) => _watchField(),
                              controller: _passwordController,
                              obscureText: _isPasswordHidden,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                          IconButton(
                              tooltip: 'Munculkan password',
                              icon: Icon(
                                  _isPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: _4highDevice * 0.1,
                                  color: Colors.grey[500]),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              })
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: _2highDevice * 0.8,
                      child: Tooltip(
                        message: 'Anda gabut? ',

                        // waitDuration: Duration(milliseconds: 200),
                        child: FlatButton(
                          // color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginPage.routeName);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Sudah punya akun?',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: _4highDevice * 0.07,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: _2highDevice * 0.8,
                      height: _4highDevice * 0.25,
                      child: RaisedButton(
                        color: _enableButton
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        onPressed: () {
                          if (_enableButton) {
                            auth
                                .signup(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    username: _usernameController.text)
                                .whenComplete(() => Fluttertoast.showToast(
                                    msg: 'Register Successful',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    textColor: Colors.grey[200],
                                    fontSize: 16.0));
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Mohon isi semua field',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Theme.of(context).primaryColor,
                                textColor: Colors.grey[200],
                                fontSize: 16.0);
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Sign Up',
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
