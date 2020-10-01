import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/pages/detail_team_job_page.dart';
import 'package:layout2/providers/team.dart';
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

class JobTeamLists extends StatefulWidget {
  @override
  _JobTeamListsState createState() => _JobTeamListsState();
}

class _JobTeamListsState extends State<JobTeamLists> {
  bool _doneButtonTapped = false;
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

  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var widthDevice = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    final auth = Provider.of<Auth>(context);
    // final team = Provider.of<Team>(context);
    final job = Provider.of<Jobs>(context);

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
        await job.fetchJob();
        await auth.getCurrentUserData();
      },
      child: Container(
        height: _highDevice * 0.525,
        child: ListView.builder(
            itemCount: job.filteredJobs.length,
            itemBuilder: (context, index) => Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Container(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            DetailTeamJobPage.routeName,
                            arguments:
                                job.filteredJobs.values.toList()[index].id);
                        job.findById(
                            job.filteredJobs.values.toList()[index].id);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: _4highDevice * 0.1,
                            vertical: _4highDevice * 0.1),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: _4highDevice * 0.46,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            print(details.delta.dx);
                            if (details.delta.dx > 8) {
                              // _showAppDrawer(context);
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${job.filteredJobs.values.toList()[index].title}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff333333),
                                    fontSize: _4highDevice * 0.13),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${DateUtil().formattedDate(DateTime.parse(job.filteredJobs.values.toList()[index].tanggal))}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
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
                          color:
                              _doneButtonTapped ? Colors.white : Colors.green,
                        ),
                      ),
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        _changeDoneButton();
                        print('tapped');
                        _showToast(
                            '${job.filteredJobs.values.toList()[index].title} Selesai :D');
                        job.deleteJob(
                            job.filteredJobs.values.toList()[index].id);
                      },
                    ),
                  ],
                )),
      ),
    );
  }
}
