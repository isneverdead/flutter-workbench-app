import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './providers/posts.dart';

import './screen/home_screen.dart';
import './screen/edit_post_screen.dart';
import './screen/login_screen.dart';
import './screen/register_screen.dart';
import './screen/splash_screen.dart';

void main() {
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
        ChangeNotifierProxyProvider<Auth, Posts>(
          update: (ctx, auth, posts) => Posts(auth.token),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'shipost',
          theme: ThemeData(
            primaryColor: Colors.green[600],
            accentColor: Colors.blue[300],
          ),
          home:
              // LoginScreen(),
              auth.isAuth
                  ? HomeScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : LoginScreen(),
                    ),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            EditPostScreen.routeName: (ctx) => EditPostScreen(),
          },
        ),
      ),
    );
  }
}
