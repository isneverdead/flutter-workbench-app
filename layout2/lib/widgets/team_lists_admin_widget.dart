import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/providers/screen_state.dart';
import 'package:layout2/providers/team.dart';
import 'package:layout2/styles/my_icons.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/jobs.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DateUtil {
  static const DATE_FORMAT = 'EEEEE, d MMMM yyyy';
  String formattedDate(DateTime dateTime) {
    // print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}

class ShowOption {
  final bool isOpen;
  ShowOption(this.isOpen);
}

class TeamListsAdmin extends StatefulWidget {
  @override
  _TeamListsAdminState createState() => _TeamListsAdminState();
}

class _TeamListsAdminState extends State<TeamListsAdmin> {
  bool _doneButtonTapped = false;
  bool _showOption = false;

  void _changeDoneButton() {
    setState(() {
      _doneButtonTapped = true;
    });
    Timer(Duration(milliseconds: 300), () {
      setState(() {
        _doneButtonTapped = false;
      });
    });
  }

  Map<String, ShowOption> optionStatus = {};
  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var _widthDevice = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    final auth = Provider.of<Auth>(context);
    final team = Provider.of<Team>(context);
    final screenState = Provider.of<ScreenState>(context);

    void _showToast(String msg) {
      Fluttertoast.showToast(
          msg: '$msg',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.grey[200],
          fontSize: 16.0);
    }

    return RefreshIndicator(
      onRefresh: () async {
        // await team.fetchJob();
        await auth.getCurrentUserData();
      },
      child: Container(
        height: _highDevice * 0.525,
        child: ListView.builder(
            itemCount: team.teams.length,
            itemBuilder: (context, index) {
              // print(index);
              optionStatus.putIfAbsent('$index', () => ShowOption(false));
              // print(optionStatus.values.toList()[index].isOpen);
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Container(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(DetailPage.routeName,
                      //     arguments: team.jobs.values.toList()[index].id);
                      // team.findById(team.jobs.values.toList()[index].id);
                      screenState.changeHomePageView('detail team widget');
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(bottom: 10),
                      width: _widthDevice,
                      height: optionStatus.values.toList()[index].isOpen
                          ? _4highDevice * 0.75
                          : _4highDevice * 0.46,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: _widthDevice * 0.9,
                              padding:
                                  EdgeInsets.only(left: 5, right: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: _4highDevice * 0.85,
                                    height: _4highDevice * 0.2,
                                    child: Tooltip(
                                      message: 'Anda gabut? ',

                                      // waitDuration: Duration(milliseconds: 200),
                                      child: FlatButton(
                                        color: screenState
                                                    .detailTeamListContent ==
                                                'member'
                                            ? Color(0xff2F80ED)
                                            : Theme.of(context).primaryColor,
                                        onPressed: () {
                                          screenState
                                              .changedetailTeamListContent(
                                                  'member');
                                          // team.fillFilteredJobsByStatus(
                                          //     'hide Job');
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
                                              'Edit',
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
                                    width: _4highDevice * 0.85,
                                    height: _4highDevice * 0.2,
                                    child: Tooltip(
                                      message: 'Anda gabut? ',

                                      // waitDuration: Duration(milliseconds: 200),
                                      child: FlatButton(
                                        color: screenState
                                                    .detailTeamListContent ==
                                                'member'
                                            ? Color(0xff2F80ED)
                                            : Theme.of(context).primaryColor,
                                        onPressed: () {
                                          screenState
                                              .changedetailTeamListContent(
                                                  'member');
                                          // team.fillFilteredJobsByStatus(
                                          //     'hide Job');
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
                                              'Hapus',
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
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: _4highDevice * 0.1,
                                vertical: _4highDevice * 0.1),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: _4highDevice * 0.46,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(-1, 0),
                                    end: Alignment(1, 0),
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Color(0xff001AFF),
                                    ]),
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                print(details.delta.dx);
                                if (details.delta.dx > 8) {
                                  // _showAppDrawer(context);
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${team.teams.values.toList()[index].namaTeam}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontSize: _4highDevice * 0.13),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '',
                                        // '${DateUtil().formattedDate(DateTime.parse(team.teams.values.toList()[index].idTeam))}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        iconsMore,
                                        // width: ,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (optionStatus.values
                                                  .toList()[index]
                                                  .isOpen ==
                                              true) {
                                            optionStatus.update(
                                                '$index',
                                                (value) =>
                                                    value = ShowOption(false));
                                          } else if (optionStatus.values
                                                  .toList()[index]
                                                  .isOpen ==
                                              false) {
                                            optionStatus.update(
                                                '$index',
                                                (value) =>
                                                    value = ShowOption(true));
                                          }
                                          print('object');
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                secondaryActions: [
                  IconSlideAction(
                    caption: '',
                    color: Colors.transparent,
                    // icon: ,
                    iconWidget: Container(
                      width: _4highDevice * 0.25,
                      height: _4highDevice * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _doneButtonTapped
                            ? Colors.green
                            : Colors.transparent,
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: _doneButtonTapped ? Colors.white : Colors.green,
                      ),
                    ),
                    onTap: () {
                      HapticFeedback.heavyImpact();
                      _changeDoneButton();
                      print('tapped');
                      // _showToast(
                      //     '${team.jobs.values.toList()[index].title} Selesai :D');
                      // team.deleteJob(team.jobs.values.toList()[index].id);
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
