import 'package:flutter/material.dart';
import 'package:fooder/screen/checkout_screen.dart';
import './screen/home_screen.dart';
import './screen/promo_screen.dart';
import './screen/detail_resto_page.dart';
import 'package:provider/provider.dart';
import './providers/foods.dart';
import './screen/success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const color = const Color.fromRGBO(232, 76, 79, 0);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Foods(),
        ),
      ],
      child: MaterialApp(
        title: 'fooder',
        theme: ThemeData(
          primaryColor: Colors.red[700],
          primaryColorLight: Color.fromARGB(80, 232, 76, 79),
          accentColor: Colors.amber[400],
        ),
        home: HomeScreen(),
        routes: {
          DetailRestoPage.routeName: (ctx) => DetailRestoPage(),
          SuccessScreen.routeName: (ctx) => SuccessScreen(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          PromoScreen.routeName: (ctx) => PromoScreen(),
        },
      ),
    );
  }
}
