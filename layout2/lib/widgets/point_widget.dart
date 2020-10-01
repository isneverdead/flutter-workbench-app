import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/pages/profile_page.dart';
import 'package:layout2/providers/screen_state.dart';
import 'package:layout2/widgets/job_lists_widget.dart';
import 'package:layout2/widgets/point_list_widget.dart';
import 'package:layout2/widgets/team_lists_widget.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/jobs.dart';

class PointWidget extends StatefulWidget {
  final BuildContext konteks;
  PointWidget(this.konteks);
  @override
  _PointWidgetState createState() => _PointWidgetState();
}

class _PointWidgetState extends State<PointWidget> {
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
      child: Column(
        children: [
          Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: _4highDevice * 0.03),
                    child: Text(
                      'Poin',
                      style: TextStyle(
                          fontSize: _4highDevice * 0.1,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '270',
                    style: TextStyle(
                        fontSize: _4highDevice * 0.17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
// Title card

          Container(
            margin: EdgeInsets.symmetric(vertical: _4highDevice * 0.1),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              'Hari ini anda mendapatkan 1 point',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
          ),
          PointList(),
        ],
      ),
    );
  }
}
