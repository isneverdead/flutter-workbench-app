import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/my_icons.dart';

class IconMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(iconFavorite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Favourite'),
                ),
              ],
            ),
            onTap: () {
              print('pressed');
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(iconPrizeTag),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Cheap'),
                ),
              ],
            ),
            onTap: () {
              print('pressed');
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      iconStonk,
                      // width: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Trend'),
                ),
              ],
            ),
            onTap: () {
              print('pressed');
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: SvgPicture.asset(iconMore),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('More'),
                ),
              ],
            ),
            onTap: () {
              print('pressed');
            },
          ),
        ],
      ),
    );
  }
}
