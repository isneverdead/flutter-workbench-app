import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/pages/profile_page.dart';
import 'package:layout2/providers/screen_state.dart';
import 'package:layout2/widgets/job_lists_widget.dart';
import 'package:layout2/widgets/team_lists_widget.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/jobs.dart';

class HomeWidget extends StatefulWidget {
  final BuildContext konteks;
  HomeWidget(this.konteks);
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String _homePageView = 'job';
  void _changeHomePageView(String view) {
    setState(() {
      _homePageView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var widthDevice = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    final auth = Provider.of<Auth>(context);
    final job = Provider.of<Jobs>(context);
    final screenState = Provider.of<ScreenState>(context);
    return Container(
      color: Color(0xffECF5F8),
      child: Column(
        children: [
          Container(
            height: _4highDevice,
            width: _2highDevice * 0.9,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    // color: Colors.red,
                    alignment: Alignment.bottomCenter,
                    width: _2highDevice * 0.9,
                    height: _4highDevice * 0.7,
                    child: Container(
                      // alignment: Alignment.bottomLeft,
                      width: _2highDevice * 0.87,
                      height: _4highDevice * 0.5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _changeHomePageView('team');
                              // screenState.changeListContent('team');
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: _4highDevice * 0.2,
                              width: _4highDevice * 0.75,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: _homePageView == 'team'
                                            ? Colors.transparent
                                            : Color.fromARGB(64, 0, 0, 0),
                                        offset: Offset(-1.5, 3),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0)
                                  ],
                                  color: _homePageView == 'team'
                                      ? Colors.transparent
                                      : Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(2),
                                    topRight: Radius.circular(2),
                                    topLeft: Radius.circular(2),
                                  )),
                              alignment: Alignment.center,
                              child: Text(
                                'Team',
                                style: TextStyle(
                                    color: _homePageView == 'team'
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontSize: _4highDevice * 0.1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: _4highDevice * 0.19,
                            color: Colors.white,
                          ),
                          GestureDetector(
                            onTap: () {
                              _changeHomePageView('job');
                              // screenState.changeListContent('job');
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: _4highDevice * 0.2,
                              width: _4highDevice * 0.75,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: _homePageView == 'job'
                                            ? Colors.transparent
                                            : Color.fromARGB(64, 0, 0, 0),
                                        offset: Offset(1.5, 3),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0)
                                  ],
                                  color: _homePageView == 'job'
                                      ? Colors.transparent
                                      : Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(2),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(2),
                                    topLeft: Radius.circular(2),
                                  )),
                              alignment: Alignment.center,
                              child: Text(
                                'Tugas',
                                style: TextStyle(
                                    color: _homePageView == 'job'
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                    fontSize: _4highDevice * 0.1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfilePage.routeName);
                    },
                    child: Container(
                      width: _2highDevice * 0.9,
                      height: _4highDevice * 0.7,
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: _4highDevice * 0.35,
                              height: _4highDevice * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                      image: NetworkImage(auth.photoUrl != null
                                          ? auth.photoUrl
                                          : 'http://nwsid.net/wp-content/uploads/2015/05/dummy-profile-pic.png'))),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: _4highDevice * 0.1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: _4highDevice * 0.03),
                                    child: Text(
                                      'Hi,  ${auth.username != null ? auth.username : 'John Doe'}',
                                      style: TextStyle(
                                          fontSize: _4highDevice * 0.11,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey[800]),
                                    ),
                                  ),
                                  Text(
                                    '0 Point',
                                    style: TextStyle(
                                        fontSize: _4highDevice * 0.09,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
// name card

          SizedBox(height: 20),

          if (_homePageView == 'job')
            Container(
              width: MediaQuery.of(context).size.width * 0.79,
              child: Text(
                'You have ${job.jobs.length} task today',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[800]),
              ),
            ),
// you have 5 task
          if (_homePageView == 'job') JobLists(),
          if (_homePageView == 'team') TeamLists(),
        ],
      ),
    );
  }
}
