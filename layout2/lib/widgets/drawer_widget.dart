import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../pages/profile_page.dart';
import '../pages/login_page.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var widthDevice = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    final auth = Provider.of<Auth>(context);
    // final job = Provider.of<Jobs>(context);
    return Drawer(
      child: Container(
        color: Color(0xffE9E9E9),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: _4highDevice * 0.3),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfilePage.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: _4highDevice * 0.3,
                  decoration: BoxDecoration(
                      color: Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.event_available,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(width: 30),
                      Text(
                        'Completed Task',
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: _4highDevice * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfilePage.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: _4highDevice * 0.3,
                  decoration: BoxDecoration(
                      color: Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(width: 30),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: _4highDevice * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  auth.logout();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (c) => LoginPage()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: _4highDevice * 0.3,
                  decoration: BoxDecoration(
                      color: Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_return,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(width: 30),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: _4highDevice * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
