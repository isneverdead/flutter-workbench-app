import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:layout2/models/job.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/providers/screen_state.dart';
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

class PointList extends StatefulWidget {
  @override
  _PointListState createState() => _PointListState();
}

class _PointListState extends State<PointList> {
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
    final job = Provider.of<Jobs>(context);
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
          itemCount: job.jobs.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(
                horizontal: _4highDevice * 0.1, vertical: _4highDevice * 0.1),
            width: MediaQuery.of(context).size.width * 0.9,
            height: _4highDevice * 0.46,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                print(details.delta.dx);
                if (details.delta.dx > 8) {
                  // _showAppDrawer(context);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${job.jobs.values.toList()[index].title}',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xff4F4F4F),
                              fontSize: _4highDevice * 0.13),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${DateUtil().formattedDate(DateTime.parse(job.jobs.values.toList()[index].tanggal))}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff4F4F4F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      '+1',
                      style: TextStyle(
                        fontSize: _4highDevice * 0.2,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4F4F4F),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
