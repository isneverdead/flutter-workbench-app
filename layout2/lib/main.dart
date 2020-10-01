import 'package:flutter/material.dart';
import 'package:layout2/pages/add_team_page.dart';
import 'package:layout2/pages/detail_page.dart';
import 'package:layout2/pages/detail_team_job_page.dart';
import 'package:layout2/pages/edit_profile_page.dart';
import 'package:layout2/pages/edit_team_page.dart';
import 'package:layout2/pages/find_members_page.dart';
import 'package:layout2/pages/home_page.dart';
import 'package:layout2/pages/profile_page.dart';
import 'package:layout2/pages/register_page.dart';
import 'package:layout2/pages/reset_password_page.dart';
import 'package:layout2/pages/test_page.dart';
import 'package:layout2/providers/jobs.dart';
import 'package:layout2/providers/screen_state.dart';
import 'package:layout2/providers/team.dart';
import 'package:layout2/widgets/splash.dart';
import 'pages/login_page.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'package:flutter/services.dart';

void main() async {
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Jobs(),
        ),
        ChangeNotifierProvider.value(
          value: ScreenState(),
        ),
        ChangeNotifierProvider.value(
          value: Team(),
        ),
      ],
      child: MaterialApp(
        title: 'WorkBench App',
        theme: ThemeData(
          primaryColor: Color(0xff56CCF2),
          backgroundColor: Color(0xffECF5F8),
        ),
        home: //
            // AddTeam(),
            // HomePage(),
            SplashScreen(
          loadingTime: 3000,
          mode: 'login',
        ),
        routes: {
          LoginPage.routeName: (ctx) => LoginPage(),
          ProfilePage.routeName: (ctx) => ProfilePage(),
          EditProfilePage.routeName: (ctx) => EditProfilePage(),
          RegisterPage.routeName: (ctx) => RegisterPage(),
          HomePage.routeName: (ctx) => HomePage(),
          DetailPage.routeName: (ctx) => DetailPage(),
          DetailTeamJobPage.routeName: (ctx) => DetailTeamJobPage(),
          ResetPasswordPage.routeName: (ctx) => ResetPasswordPage(),
          AddTeam.routeName: (ctx) => AddTeam(),
          EditTeam.routeName: (ctx) => EditTeam(),
          FindMembers.routeName: (ctx) => FindMembers(),
        },
      ),
    );
  }
}
