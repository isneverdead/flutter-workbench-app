import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooder/screen/promo_screen.dart';
import '../widgets/icon_menu.dart';
import '../widgets/image_slider.dart';
import '../styles/my_icons.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _notification = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: deviceHeight / 2 * 0.3,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: deviceHeight / 2 * 0.6,
                      padding: EdgeInsets.only(
                          left: 15, right: 10, top: 1, bottom: 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).primaryColorLight
                          // color: Color.fromARGB(80, 232, 76, 79),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jl . Jayakatwang no 301',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600,
                                fontSize: deviceHeight / 4 * 0.09),
                          ),
                          Container(
                            height: deviceHeight / 4 * 0.16,
                            width: deviceHeight / 4 * 0.15,
                            child: IconButton(
                              icon: SvgPicture.asset(iconDropDown),
                            ),
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 10),
                    height: deviceHeight / 4 * 0.25,
                    child: Stack(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: 10),
                          width: deviceHeight / 4 * 0.2,
                          height: deviceHeight / 4 * 0.2,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              iconBell,
                              color: Colors.white,
                              // width: deviceHeight / 4 * 0.13,
                            ),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              setState(() {
                                _notification = !_notification;
                              });
                            },
                          ),
                        ),
                        if (!_notification)
                          Positioned(
                            top: 25,
                            right: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: deviceHeight / 4 * 0.07,
                              height: deviceHeight / 4 * 0.07,
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Yahya',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('What do you want to eat?'),
              ],
            ),
          ),
          IconMenu(),
          Container(
            // padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today\'s promo',
                        style: TextStyle(fontSize: deviceHeight / 4 * 0.15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PromoScreen.routeName);
                        },
                        child: Text(
                          'see all',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: deviceHeight / 4 * 0.1),
                        ),
                      )
                    ],
                  ),
                ),
                ImageSlider(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          height: deviceHeight / 2 * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Container(
                  // padding: EdgeInsets.all(deviceHeight / 4 * 0.1),
                  child: SvgPicture.asset(iconHome),
                ),
                onTap: () {
                  print('Button Home Tapped');
                },
              ),
              GestureDetector(
                child: Container(
                  // padding: EdgeInsets.all(deviceHeight / 4 * 0.1),
                  child: SvgPicture.asset(iconShoppingBag),
                ),
                onTap: () {
                  print('Button Shopping Basket Tapped');
                },
              ),
              GestureDetector(
                child: Container(
                  // padding: EdgeInsets.all(deviceHeight / 4 * 0.1),
                  child: SvgPicture.asset(iconSearch),
                ),
                onTap: () {
                  print('Button Search Tapped');
                },
              ),
              GestureDetector(
                child: Container(
                  // padding: EdgeInsets.all(deviceHeight / 4 * 0.1),
                  child: SvgPicture.asset(iconPerson),
                ),
                onTap: () {
                  print('Button Person Tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
