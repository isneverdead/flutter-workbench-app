import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooder/screen/detail_resto_page.dart';
import '../styles/my_images.dart';

class ImageSliderItem extends StatefulWidget {
  @override
  _ImageSliderItemState createState() => _ImageSliderItemState();
}

class _ImageSliderItemState extends State<ImageSliderItem> {
  bool isTapped = false;
  void changeColor() {
    setState(() {
      isTapped = false;
    });
    print(isTapped);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      height: deviceHeight / 2 * 0.8,
      width: deviceHeight / 2 * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imagesFruitSaladMix)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(DetailRestoPage.routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    print('Button pressed');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.favorite_border,
                        size: 20, color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: deviceHeight / 2 * 0.62,
                  child: Card(
                    margin: EdgeInsets.only(bottom: 20),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 5, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fruit Salad Mix',
                            style: TextStyle(fontSize: deviceHeight / 4 * 0.1),
                          ),
                          Text(
                            'Delics Fruit salad, Ngasem',
                            style: TextStyle(
                              fontSize: deviceHeight / 4 * 0.07,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '18.500',
                                    style: TextStyle(
                                        fontSize: deviceHeight / 4 * 0.1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('22.500',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isTapped = true;
                                    });

                                    Timer(Duration(milliseconds: 100),
                                        changeColor);
                                    // print('5 Left pressed  : $deviceHeight');
                                    // print('context inside slider : $context');
                                    print(isTapped);
                                  },
                                  child: Card(
                                    color: isTapped
                                        ? Colors.grey
                                        : Theme.of(context).accentColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '5 Left',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
