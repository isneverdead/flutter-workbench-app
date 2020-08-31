import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooder/screen/checkout_screen.dart';
import '../widgets/store_card_item.dart';
import '../styles/my_icons.dart';
import '../styles/my_images.dart';

class DetailRestoPage extends StatefulWidget {
  static const routeName = '/detail-resto-page';
  @override
  _DetailRestoPageState createState() => _DetailRestoPageState();
}

class _DetailRestoPageState extends State<DetailRestoPage> {
  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  height: _deviceHeight / 2 * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(imagesDelicsResto),
                          fit: BoxFit.fill)),
                  // child: Image.asset(
                  //   imagesDelicsResto,
                  //   width: _deviceHeight * 0.6,
                  // ),
                ),
                Container(
                  height: _deviceHeight / 2 * 0.33,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                ),
                Container(
                  // width: double.infinity,
                  height: _deviceHeight / 2 * 0.9,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Menu Items',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: _deviceHeight / 4 * 0.12),
                                ),
                                // decoration: BoxDecoration(color: Colors),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Reviews',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: _deviceHeight / 4 * 0.12),
                                ),
                                // decoration: BoxDecoration(color: Colors),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Info',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: _deviceHeight / 4 * 0.12),
                                ),
                                // decoration: BoxDecoration(color: Colors),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: _deviceHeight / 2 * 0.75,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(5),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                StoreCardItem(
                                  deviceHeight: _deviceHeight,
                                  foodName: 'Fruit salad mix',
                                  price: '18.500',
                                ),
                                StoreCardItem(
                                  deviceHeight: _deviceHeight,
                                  foodName: 'Fruit salad mix',
                                  price: '18.500',
                                ),
                                StoreCardItem(
                                  deviceHeight: _deviceHeight,
                                  foodName: 'Fruit salad mix',
                                  price: '18.500',
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          /////////
          Positioned(
            top: 50,
            left: 10,
            child: Container(
              height: _deviceHeight / 4 * 0.2,
              width: _deviceHeight / 4 * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: SvgPicture.asset(iconArrowLeft),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Container(
              height: _deviceHeight / 4 * 0.2,
              width: _deviceHeight / 4 * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: SvgPicture.asset(iconFavorite),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
              top: _deviceHeight / 2 * 0.51,
              left: _deviceHeight / 4 * 0.08,
              child: Card(
                elevation: 5,
                child: Container(
                  height: _deviceHeight / 4 * 0.82,
                  width: _deviceHeight / 2 * 0.9,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Delics Fruit Salad',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: _deviceHeight / 4 * 0.1,
                            color: Colors.grey[800]),
                      ),
                      Text(
                        'Jl. Jaya katwang no 4, Ngasem',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: _deviceHeight / 4 * 0.09,
                            color: Colors.grey[500]),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Open',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: _deviceHeight / 4 * 0.09,
                                color: Colors.grey[800]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '8 am - 8 pm',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: _deviceHeight / 4 * 0.09,
                                  color: Colors.grey[500]),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        iconPin,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text('1 Km'),
                                      ),
                                    ],
                                  )),
                              Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        iconStar,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text('5.0'),
                                      ),
                                    ],
                                  )),
                              Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        iconVerified,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text('Verified'),
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ))
        ],
      )),
      bottomSheet: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(CheckoutScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: _deviceHeight / 2 * 0.2,
            // color: Colors.red,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1 item',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Checkout',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
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
