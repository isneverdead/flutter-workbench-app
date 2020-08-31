import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooder/screen/success_screen.dart';
import 'package:fooder/widgets/store_card_item.dart';
import '../styles/my_icons.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout';
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _backButton = false;
  bool _isTapped = false;
  void _toggleBackButton() {
    setState(() {
      _backButton = !_backButton;
    });
  }

  void _enable() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              color: Colors.white,
              // margin: EdgeInsets.only(top: 0, left: 0),
              padding: EdgeInsets.only(
                  top: deviceHeight / 4 * 0.27, left: 10, bottom: 0, right: 0),
              height: deviceHeight / 2 * 0.27,
              child: Stack(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: deviceHeight / 4 * 0.465),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                fontSize: deviceHeight / 4 * 0.17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: -13,
                  child: GestureDetector(
                    onTap: () {
                      _toggleBackButton();
                      Timer(Duration(milliseconds: 100), _toggleBackButton);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color:
                          _backButton ? Colors.grey[100] : Colors.transparent,
                      padding: EdgeInsets.all(20),
                      // margin: EdgeInsets.only(left: deviceHeight / 4 * 0.05),
                      child: SvgPicture.asset(iconArrowLeft),
                    ),
                  ),
                )
              ]),
            ), // end app bar
            Container(
              height: deviceHeight * 0.77,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight / 4 * 0.1,
                          left: deviceHeight / 4 * 0.08,
                          right: deviceHeight / 4 * 0.08),
                      padding: EdgeInsets.all(deviceHeight / 4 * 0.08),
                      // height: deviceHeight / 2 * 0.19,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Keep social distancing',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w600,
                                      fontSize: deviceHeight / 4 * 0.093),
                                ),
                                Text(
                                  'Leave your order on the doorstep',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500,
                                      fontSize: deviceHeight / 4 * 0.079),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _enable();
                              // _isTapped = !_isTapped;
                              print('tapped');
                            },
                            child: Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    duration: Duration(milliseconds: 300),
                                    left: _isTapped ? 20 : 0,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: _isTapped
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // end social distancing
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight / 4 * 0.1,
                          left: deviceHeight / 4 * 0.08,
                          right: deviceHeight / 4 * 0.1),
                      padding: EdgeInsets.all(deviceHeight / 4 * 0.08),
                      height: deviceHeight / 2 * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: deviceHeight / 4 * 0.25,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deliver to',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.w600,
                                          fontSize: deviceHeight / 4 * 0.079),
                                    ),
                                    Text(
                                      'Jl. Jayakatwang no 301',
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w500,
                                          fontSize: deviceHeight / 4 * 0.093),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: deviceHeight / 4 * 0.15,
                                width: deviceHeight / 4 * 0.15,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 1.8,
                                      color: Theme.of(context).primaryColor),
                                ),
                                child: Container(
                                  height: deviceHeight / 4 * 0.05,
                                  width: deviceHeight / 4 * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: deviceHeight / 4 * 0.1),
                            padding:
                                EdgeInsets.only(left: deviceHeight / 4 * 0.02),
                            height: deviceHeight / 4 * 0.19,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  iconTextField,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, right: 10),
                                  width: deviceHeight / 2 * 0.75,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText:
                                          'Add a note of delivery address',
                                      hintStyle: TextStyle(
                                        fontSize: deviceHeight / 4 * 0.08,
                                        color: Colors.grey[500],
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ), // end deliver
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight / 4 * 0.1,
                          left: deviceHeight / 4 * 0.08,
                          right: deviceHeight / 4 * 0.08),
                      padding: EdgeInsets.all(deviceHeight / 4 * 0.08),
                      // height: deviceHeight / 2 * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'My Bucket',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w600,
                                            fontSize: deviceHeight / 4 * 0.12),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _isTapped = !_isTapped;
                                    print('tapped');
                                  },
                                  child: Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Add items',
                                        style: TextStyle(
                                            fontSize: deviceHeight / 4 * 0.08,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          ),
                          StoreCardItem(
                            deviceHeight: deviceHeight,
                            foodName: 'Fruit salad mix',
                            price: '20.000',
                          ),
                          StoreCardItem(
                            deviceHeight: deviceHeight,
                            foodName: 'Fruit salad mix choco',
                            price: '20.000',
                          ),
                        ],
                      ),
                    ), //end card store
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight / 4 * 0.1,
                          left: deviceHeight / 4 * 0.08,
                          right: deviceHeight / 4 * 0.08),
                      padding: EdgeInsets.all(deviceHeight / 4 * 0.08),
                      height: deviceHeight / 2 * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Payment',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.w600,
                                          fontSize: deviceHeight / 4 * 0.13),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item total',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w400,
                                    fontSize: deviceHeight / 4 * 0.1),
                              ),
                              Text(
                                'Rp 18.500',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w400,
                                    fontSize: deviceHeight / 4 * 0.1),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery fee',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w400,
                                    fontSize: deviceHeight / 4 * 0.1),
                              ),
                              Text(
                                'Rp 0',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w400,
                                    fontSize: deviceHeight / 4 * 0.1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(10),
          height: deviceHeight / 2 * 0.2,
          // color: Colors.red,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SuccessScreen.routeName);
            },
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Place order',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Rp. 18.500',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
