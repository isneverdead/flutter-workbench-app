import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout2/providers/auth.dart';
import 'package:layout2/widgets/enter_exit_page_route.dart';
import 'package:layout2/widgets/slide_from_right_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/my_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../providers/jobs.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  final double loadingTime;
  final String mode;
  // final double
  SplashScreen({this.loadingTime, this.mode});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isUser = false;
  double y = -1;
  double proggressValue = 10;
  bool _isPageVisible = true;
  String _token;

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isAdmin = prefs.getBool('is_admin');
    final data = prefs.getString('userToken');

    if (data != null) {
      setState(() {
        _isUser = true;
        // _token = prefs.getString('userData');
      });
    }
    print('==splash== token is -> $data');
  }

  void setLoading() {
    setState(() {
      y = 1;
      proggressValue = 296;
    });
  }

  void _fetchJob() {
    if (widget.mode == 'login') {
      final job = Provider.of<Jobs>(context, listen: false);
      job.fetchJob();
    }
  }

  void _getUser() async {
    if (widget.mode == 'login') {
      final auth = Provider.of<Auth>(context, listen: false);
      auth.getCurrentUserData();
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isAdmin = prefs.getBool('is_admin');
    print('Is Admin ? $isAdmin');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCheck();

    // if (_isUser) {
    //   Navigator.pushReplacement(
    //       context, SlideFromRightPage(widget: HomePage(), duration: 500));
    //   Fluttertoast.showToast(
    //       msg: 'Login Successful',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Theme.of(context).primaryColor,
    //       textColor: Colors.grey[200],
    //       fontSize: 16.0);
    // }
    Future.delayed(Duration(milliseconds: 900), () {
      setLoading();
    });
    Future.delayed(Duration(milliseconds: widget.loadingTime.toInt() + 500),
        () {
      setState(() {
        _isPageVisible = false;
      });
      _initCheck();
    });
    Future.delayed(Duration(milliseconds: widget.loadingTime.toInt() + 1000),
        () {
      // _initCheck();
      if (_isUser) {
        _fetchJob();
        _getUser();

        Navigator.pushReplacement(
            context, SlideFromRightPage(widget: HomePage(), duration: 500));
        Fluttertoast.showToast(
            msg: 'Login Successful',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.grey[200],
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'Login Failed',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.grey[200],
            fontSize: 16.0);
        Navigator.pushReplacement(
            context, SlideFromRightPage(widget: LoginPage(), duration: 500));
      }
      //
      // Navigator.push(
      //     context, SlideFromRightPage(widget: HomePage(), duration: 500));

      //
      // Navigator.of(context).pushNamed(HomePage.routeName);
      // Navigator.of(context).pushReplacementNamed(
      //     widget.isUser ? HomePage.routeName : LoginPage.routeName);
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (c) => _isUser ? HomePage() : LoginPage()));
      // widget.isUser ? HomePage.routeName : LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: _isPageVisible ? 1 : 0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0, 1),
                end: Alignment(0, y),
                colors: [
                  Color.fromARGB(220, 86, 204, 242),
                  Colors.white,
                ]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: _4highDevice * 0.1),
                  height: _4highDevice * 0.75,
                  width: _4highDevice * 0.73,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(iconsApp),
                    ),
                  ),
                ),
                SizedBox(height: _4highDevice * 0.25),
                Container(
                  width: 300,
                  height: 20,
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(50),
                    // color: Colors.red,
                  ),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          // border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        duration:
                            Duration(milliseconds: widget.loadingTime.toInt()),
                        width: proggressValue,
                        height: 18,
                      ),
                    ],
                  ),
                ),

                // RaisedButton(
                //   onPressed: () {
                //     setState(() {
                //       y = 1;
                //       proggressValue = _4highDevice - 20;
                //     });
                //   },
                //   child: Text('Animate Down'),
                // ),
                // RaisedButton(
                //   onPressed: () {
                //     setState(() {
                //       y = 1;
                //       proggressValue = _4highDevice - 4;
                //     });
                //   },
                //   child: Text('Loading Done'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
