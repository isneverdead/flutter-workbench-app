import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/pages/profile_page.dart';
import 'package:layout2/providers/screen_state.dart';
import 'package:layout2/providers/team.dart';
import 'package:layout2/widgets/job_lists_widget.dart';
import 'package:layout2/widgets/job_team_lists.dart';
import 'package:layout2/widgets/team_lists_widget.dart';
import 'package:layout2/widgets/team_member_lists.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/jobs.dart';

class TeamWidget extends StatefulWidget {
  final BuildContext konteks;
  TeamWidget(this.konteks);
  @override
  _TeamWidgetState createState() => _TeamWidgetState();
}

class _TeamWidgetState extends State<TeamWidget> {
  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var widthDevice = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    final auth = Provider.of<Auth>(context);
    final team = Provider.of<Team>(context);
    final screenState = Provider.of<ScreenState>(context);
    return Container(
      child: Column(
        children: [
          Container(
            height: _2highDevice * 0.6,
            width: _2highDevice * 0.9,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    // color: Colors.red,
                    alignment: Alignment.bottomCenter,
                    width: _2highDevice * 0.9,
                    height: _4highDevice,
                    child: Container(
                      // alignment: Alignment.bottomLeft,
                      width: _2highDevice * 0.87,
                      height: _4highDevice,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _4highDevice * 0.5,
                                height: _4highDevice * 0.2,
                                child: Tooltip(
                                  message: 'Anda gabut? ',

                                  // waitDuration: Duration(milliseconds: 200),
                                  child: FlatButton(
                                    color: screenState.detailTeamListContent ==
                                            'pending'
                                        ? Color(0xff2F80ED)
                                        : Theme.of(context).primaryColor,
                                    onPressed: () {
                                      screenState.changedetailTeamListContent(
                                          'pending');
                                      // team.fillFilteredJobsByStatus('2');
                                      screenState.changedetailTeamMembers(
                                          'hide members');
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: screenState
                                                        .detailTeamListContent ==
                                                    'pending'
                                                ? Color(0xff2F80ED)
                                                : Color(0xffFFE595),
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //     width: _4highDevice * 0.1,
                                        //     child: Image.asset(iconsGoogle)),
                                        Text(
                                          'Ditunda',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _4highDevice * 0.09,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: _4highDevice * 0.5,
                                height: _4highDevice * 0.2,
                                child: Tooltip(
                                  message: 'Anda gabut? ',

                                  // waitDuration: Duration(milliseconds: 200),
                                  child: FlatButton(
                                    color: screenState.detailTeamListContent ==
                                            'canceled'
                                        ? Color(0xff2F80ED)
                                        : Theme.of(context).primaryColor,
                                    onPressed: () {
                                      screenState.changedetailTeamListContent(
                                          'canceled');
                                      // team.fillFilteredJobsByStatus('4');
                                      screenState.changedetailTeamMembers(
                                          'hide members');
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: screenState
                                                        .detailTeamListContent ==
                                                    'canceled'
                                                ? Color(0xff2F80ED)
                                                : Color(0xffFFC0C0),
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //     width: _4highDevice * 0.1,
                                        //     child: Image.asset(iconsGoogle)),
                                        Text(
                                          'Dihapus',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _4highDevice * 0.09,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: _4highDevice * 0.5,
                                height: _4highDevice * 0.2,
                                child: Tooltip(
                                  message: 'Anda gabut? ',

                                  // waitDuration: Duration(milliseconds: 200),
                                  child: FlatButton(
                                    color: screenState.detailTeamListContent ==
                                            'completed'
                                        ? Color(0xff2F80ED)
                                        : Theme.of(context).primaryColor,
                                    onPressed: () {
                                      screenState.changedetailTeamListContent(
                                          'completed');
                                      // team.fillFilteredJobsByStatus('1');
                                      screenState.changedetailTeamMembers(
                                          'hide members');
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: screenState
                                                        .detailTeamListContent ==
                                                    'completed'
                                                ? Color(0xff2F80ED)
                                                : Color(0xffC9FFDF),
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //     width: _4highDevice * 0.1,
                                        //     child: Image.asset(iconsGoogle)),
                                        Text(
                                          'Selesai',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _4highDevice * 0.09,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _4highDevice * 1.05,
                                height: _4highDevice * 0.2,
                                child: Tooltip(
                                  message: 'Anda gabut? ',

                                  // waitDuration: Duration(milliseconds: 200),
                                  child: FlatButton(
                                    color: screenState.detailTeamListContent ==
                                            'progres'
                                        ? Color(0xff2F80ED)
                                        : Theme.of(context).primaryColor,
                                    onPressed: () {
                                      screenState.changedetailTeamListContent(
                                          'progres');
                                      // team.fillFilteredJobsByStatus('3');
                                      screenState.changedetailTeamMembers(
                                          'hide members');
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: screenState
                                                        .detailTeamListContent ==
                                                    'progres'
                                                ? Color(0xff2F80ED)
                                                : Colors.white,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //     width: _4highDevice * 0.1,
                                        //     child: Image.asset(iconsGoogle)),
                                        Text(
                                          'Progress',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _4highDevice * 0.09,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: _4highDevice * 0.5,
                                height: _4highDevice * 0.2,
                                child: Tooltip(
                                  message: 'Anda gabut? ',

                                  // waitDuration: Duration(milliseconds: 200),
                                  child: FlatButton(
                                    color: screenState.detailTeamListContent ==
                                            'member'
                                        ? Color(0xff2F80ED)
                                        : Theme.of(context).primaryColor,
                                    onPressed: () {
                                      screenState.changedetailTeamListContent(
                                          'member');
                                      // team.fillFilteredJobsByStatus('hide Job');
                                      screenState.changedetailTeamMembers(
                                          'show members');
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: screenState
                                                        .detailTeamListContent ==
                                                    'member'
                                                ? Color(0xff2F80ED)
                                                : Color(0xffC3F1FF),
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //     width: _4highDevice * 0.1,
                                        //     child: Image.asset(iconsGoogle)),
                                        Text(
                                          'Anggota',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _4highDevice * 0.09,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            gradient: LinearGradient(
                                begin: Alignment(-1, 0),
                                end: Alignment(1, 0),
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Color(0xff001AFF),
                                ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Container(
                            //   width: _4highDevice * 0.35,
                            //   height: _4highDevice * 0.35,
                            //   decoration: BoxDecoration(
                            //       color: Colors.grey,
                            //       borderRadius: BorderRadius.circular(50),
                            //       image: DecorationImage(
                            //           image: NetworkImage(auth.photoUrl != null
                            //               ? auth.photoUrl
                            //               : 'http://nwsid.net/wp-content/uploads/2015/05/dummy-profile-pic.png'))),
                            // ),
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: _4highDevice * 0.03),
                              child: Text(
                                'Team A',
                                style: TextStyle(
                                    fontSize: _4highDevice * 0.15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              '3 orang anggota',
                              style: TextStyle(
                                  fontSize: _4highDevice * 0.09,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
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

          // SizedBox(height: 20),
          if (screenState.detailTeamMembers == 'hide members') JobTeamLists(),
          if (screenState.detailTeamMembers == 'show members')
            TeamMemberLists(),
        ],
      ),
    );
  }
}
