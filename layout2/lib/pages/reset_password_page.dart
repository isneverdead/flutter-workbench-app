import 'package:flutter/material.dart';
import '../styles/my_icons.dart';

class ResetPasswordPage extends StatefulWidget {
  static const routeName = '/reset-password';
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            height: _highDevice,
            child: SingleChildScrollView(
                child: Center(
              child: Container(
                padding: EdgeInsets.only(top: _4highDevice * 0.2),
                child: Column(
                  children: [
                    SizedBox(height: _4highDevice * 0.4),
                    Container(
                      margin: EdgeInsets.only(bottom: _4highDevice * 0.1),
                      height: _4highDevice,
                      width: _4highDevice,
                      decoration: BoxDecoration(
                        // color: Colors,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(iconsResetPassword),
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
                      margin: EdgeInsets.only(top: 10, bottom: 25),
                      width: _4highDevice,
                      height: 2,
                      color: Color(0xffBACFEB),
                    ),
                    Container(
                      width: _2highDevice * 0.8,
                      child: Text(
                          'Please, enter your email address. you will receive reset password via email.'),
                    ),
                    SizedBox(height: 10),
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
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: _2highDevice * 0.8,
                      height: _4highDevice * 0.25,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Send',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: _4highDevice * 0.09,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}
