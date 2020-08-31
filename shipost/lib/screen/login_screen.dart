import 'package:flutter/material.dart';
import './home_screen.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import './register_screen.dart';
import '../providers/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home_screen.dart';

// enum AuthMode { Signup, Login }

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);

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
  // final GlobalKey<FormState> _formKey = GlobalKey();

  // Map<String, String> _authData = {
  //   'email': '',
  //   'password': '',
  // };
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    // final authen = Provider.of<Auth>(context);

    // await authen.tryAutoLogin();
    // print('INIT sTATE');
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   final authen = Provider.of<Auth>(context);
  //   var loginResponse = authen.responseLogin;
  // }

  // checkLoginStatus() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('userData') == null) {
  //     print(prefs.getString('userData'));
  //     return false;
  //   } else {
  //     Navigator.of(context).pushNamed(HomeScreen.routeName);
  //     return true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final authen = Provider.of<Auth>(context);
    // var loginRes = authen.responseLogin;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: _isLoading
          ? CircularProgressIndicator()
          : Column(
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
                  // style:
                  keyboardType: TextInputType.emailAddress,
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
                  // obscureText: true,
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
                // if (loginRes != null)
                //   Card(
                //     child: Text(loginRes),
                //   ),

                RaisedButton(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'LOGIN',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    authen.login(_emailController.text.toString(),
                        _passwordController.text.toString());
                    if (authen.responseLoginCode == 200) {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                      print(authen.responseLoginCode);
                    } else {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                ),
                FlatButton(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Belum punya akun?',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
                )
              ],
            ),
    );
  }
}
