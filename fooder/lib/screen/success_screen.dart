import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooder/screen/checkout_screen.dart';
import '../styles/my_images.dart';
import '../widgets/store_card.dart';
import '../widgets/store_card_item.dart';

class SuccessScreen extends StatefulWidget {
  static const routeName = '/success';
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: _deviceHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _deviceHeight * 0.73,
                padding: EdgeInsets.only(top: _deviceHeight / 4 * 0.45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: _deviceHeight / 2 * 0.75,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(imagesSuccess1),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        'Your order is confirmed!',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                            fontSize: _deviceHeight / 4 * 0.15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      height: 50,
                      width: 250,
                      child: Text(
                        'we\'ll deliver your order immediately, \n make sure your order put on the doorstep',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w300,
                            fontSize: _deviceHeight / 4 * 0.085),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(CheckoutScreen.routeName);
                      },
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.only(
                          left: _deviceHeight / 4 * 0.15,
                          right: _deviceHeight / 4 * 0.15,
                          top: 15,
                          bottom: 15),
                      child: Text(
                        'Check order status',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: _deviceHeight / 4 * 0.091),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 0),
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anything else?',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          fontSize: _deviceHeight / 4 * 0.15),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: _deviceHeight / 4 * 0.1),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: StoreCardItem(
                  deviceHeight: _deviceHeight,
                  foodName: 'Bakso jumbo regular',
                  price: '10.000',
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: StoreCardItem(
                  deviceHeight: _deviceHeight,
                  foodName: 'Bakso jumbo regular',
                  price: '10.000',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
