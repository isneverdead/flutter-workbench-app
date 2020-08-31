import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class SplashScreen extends StatelessWidget {
  // final String token;
  // SplashScreen(this.token);
  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context);
    // String token = auth.token;

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
        // child: Text('Loading... Token is : ' + token),
      ),
    );
  }
}
