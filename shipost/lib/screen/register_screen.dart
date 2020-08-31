import 'package:flutter/material.dart';
import 'dart:math';
import './login_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

enum AuthMode { Signup, Login }

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: LoginCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authen = Provider.of<Auth>(context);

    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ShiPost',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 30),
          TextField(
            style: TextStyle(),
            decoration: InputDecoration(
              fillColor: Theme.of(context).primaryColor,
              filled: true,
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller: _usernameController,
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(),
            decoration: InputDecoration(
              fillColor: Theme.of(context).primaryColor,
              filled: true,
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller: _emailController,
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(),
            decoration: InputDecoration(
              fillColor: Theme.of(context).primaryColor,
              filled: true,
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            controller: _passwordController,
          ),
          SizedBox(height: 15),
          RaisedButton(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'REGISTER',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              authen.signup(_emailController.text, _passwordController.text,
                  _usernameController.text);
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
          ),
          FlatButton(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Sudah punya akun?',
                style: TextStyle(fontSize: 15),
              ),
            ),
            textColor: Colors.black,
            onPressed: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
