import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layout2/models/job.dart';
import 'package:layout2/pages/add_team_page.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/pages/login_page.dart';
import 'package:layout2/pages/profile_page.dart';
import 'package:layout2/providers/jobs.dart';
import 'package:layout2/providers/screen_state.dart';
import 'package:layout2/widgets/add_job_admin_widget.dart';
import 'package:layout2/widgets/add_job_widget.dart';
import 'package:layout2/widgets/drawer_widget.dart';
import 'package:layout2/widgets/home_widget.dart';
import 'package:layout2/widgets/home_widget_admin.dart';
import 'package:layout2/widgets/my_jobs_widget.dart';
import 'package:layout2/widgets/point_widget.dart';
import 'package:layout2/widgets/splash.dart';
import 'package:layout2/widgets/team_widget.dart';
import 'package:layout2/widgets/team_widget_admin.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _doneButtonTapped = false;
  bool _showSuccessAddJob = false;
  FocusNode myFocusNode;
  final _titleController = TextEditingController();
  // final _kendalaController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  void _showAppDrawer(BuildContext kontek) {
    Scaffold.of(kontek).openDrawer();
  }

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
    PickedFile _userPhoto = auth.userProfile;
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

    Future<void> addNewJob() async {
      final job = Provider.of<Jobs>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String _token = prefs.getString('userData');

      print(_titleController.text);
      job.addJob(
          job: Job(
              id: _titleController.text,
              title: _titleController.text,
              status: '',
              kendala: 'tidak ada',
              tanggal: ''),
          token: _token);
    }

    _showModalBottomSheet(context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          //   return FractionallySizedBox(
          //     heightFactor: 0.8,
          //     child: Container(
          //       height: _highDevice,
          //       width: _4highDevice,
          //       color: Colors.red,
          //       child: TextField(),
          //     ),
          //   );
          // });
          // showModalBottomSheet(
          // backgroundColor: Colors.transparent,
          //   context: context,
          //   builder: (BuildContext context) {
          if (auth.isAdmin) {
            return AddJobAdmin();
          } else {
            return AddJob();
          }
        },
      );
    }

    DateTime currentBackPressTime;

    return WillPopScope(
      onWillPop: () async {
        // screenState.changeHomePageView('home widget');
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          // Fluttertoast.showToast(msg: exit_warning);
          print('pencet lagi untuk keluar');
          return Future.value(false);
        }
        exit(0);
        // return Future.value(true);
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        // appBar: AppBar(
        //   title: Text('Home'),
        //   centerTitle: true,
        // ),
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: DrawerWidget(),
        body: Builder(
          builder: (context) => Container(
            padding: EdgeInsets.only(
                left: _4highDevice * 0.1, right: _4highDevice * 0.1),
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                print(details.delta.dx);
                if (details.delta.dx > 10) {
                  _showAppDrawer(context);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: _4highDevice * 0.25),

                  SizedBox(height: 10),
                  if (screenState.homePageView == 'home widget')
                    auth.isAdmin
                        ? HomeWidgetAdmin(context)
                        : HomeWidget(context),

                  if (screenState.homePageView == 'myjobs widget')
                    MyJobs(context),
                  if (screenState.homePageView == 'point widget')
                    PointWidget(context),
                  if (screenState.homePageView == 'detail team widget')
                    auth.isAdmin
                        ? TeamWidgetAdmin(context)
                        : TeamWidget(context),

                  // end column
                ],
              ),
            ),
          ),
        ),
        bottomSheet: BottomAppBar(
          // elevation: 5,

          color: Colors.transparent,
          child: Container(
            height: _4highDevice * 0.4,
            decoration: BoxDecoration(
                color: Color(0xffE0E0E0),
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      screenState.changeHomePageView('home widget');
                    },
                    icon: Icon(
                      Icons.home,
                      size: _4highDevice * 0.17,
                      color: screenState.homePageView == 'home widget'
                          ? Theme.of(context).primaryColor
                          : Color(0xff4F4F4F),
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      screenState.changeHomePageView('myjobs widget');
                    },
                    icon: Icon(
                      Icons.check_box,
                      size: _4highDevice * 0.17,
                      color: screenState.homePageView == 'myjobs widget'
                          ? Theme.of(context).primaryColor
                          : Color(0xff4F4F4F),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: _4highDevice * 0.3,
                  height: _4highDevice * 0.3,
                  // padding: EdgeInsets.only(left: 5, right: 6),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(64, 0, 0, 0),
                            // color: Color.fromARGB(255, 0, 255, 109),
                            offset: Offset(0, 1),
                            blurRadius: 0,
                            spreadRadius: 1.0),
                      ],
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: _4highDevice * 0.17,
                      ),
                      onPressed: () {
                        if (screenState.homePageView == 'home widget') {
                          if (auth.isAdmin) {
                            Navigator.of(context).pushNamed(AddTeam.routeName);
                          } else {
                            _showModalBottomSheet(context);
                          }
                        } else if (screenState.homePageView ==
                            'myjobs widget') {
                          _showModalBottomSheet(context);
                        }
                      }),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProfilePage.routeName);
                    },
                    icon: Icon(
                      Icons.person,
                      size: _4highDevice * 0.17,
                      color: Color(0xff4F4F4F),
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      screenState.changeHomePageView('point widget');
                    },
                    icon: Icon(
                      Icons.star,
                      size: _4highDevice * 0.17,
                      color: screenState.homePageView == 'point widget'
                          ? Theme.of(context).primaryColor
                          : Color(0xff4F4F4F),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
