import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/my_icons.dart';

class AppBarPromo extends StatefulWidget {
  @override
  _AppBarPromoState createState() => _AppBarPromoState();
}

class _AppBarPromoState extends State<AppBarPromo> {
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: _deviceHeight / 4 * 0.05),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 6),
              child: Row(
                children: [
                  SvgPicture.asset(iconFilter),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Filters',
                      style: TextStyle(fontSize: _deviceHeight / 4 * 0.09),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 6),
              child: Row(
                children: [
                  SvgPicture.asset(iconSend),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Nearby',
                      style: TextStyle(
                          fontSize: _deviceHeight / 4 * 0.09,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 6),
              child: Row(
                children: [
                  SvgPicture.asset(iconStar),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Above 4.5',
                      style: TextStyle(fontSize: _deviceHeight / 4 * 0.09),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 6),
              child: Row(
                children: [
                  Container(
                      height: _deviceHeight / 4 * 0.1,
                      child: SvgPicture.asset(iconPrizeTag)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Cheapest',
                      style: TextStyle(fontSize: _deviceHeight / 4 * 0.09),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 6),
              child: Row(
                children: [
                  Container(
                      height: _deviceHeight / 4 * 0.1,
                      child: SvgPicture.asset(iconFilter)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Filters',
                      style: TextStyle(fontSize: _deviceHeight / 4 * 0.09),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
