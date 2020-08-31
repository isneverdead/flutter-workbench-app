import 'package:flutter/material.dart';
import './store_card_item.dart';
import '../providers/foods.dart';
import 'package:provider/provider.dart';

class StoreCard extends StatefulWidget {
  final String storeName;
  final String streetName;
  final String star;
  final String distance;
  final double deviceHeight;
  // final String keyItem;
  // final BuildContext parentContext;
  StoreCard({
    @required this.storeName,
    @required this.streetName,
    @required this.distance,
    @required this.star,
    @required this.deviceHeight,
    // @required this.keyItem,
    // @required this.parentContext,
  });
  @override
  _StoreCardState createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  @override
  Widget build(BuildContext context) {
    // final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceHeight = widget.deviceHeight;
    final food = Provider.of<Foods>(context);

    return Container(
      width: _deviceHeight / 2 * 0.95,
      margin: EdgeInsets.only(top: 10),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.storeName,
                        style: TextStyle(fontSize: _deviceHeight / 4 * 0.1),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: Theme.of(context).accentColor,
                              size: _deviceHeight / 4 * 0.13,
                            ),
                            Text(
                              widget.star,
                              style:
                                  TextStyle(fontSize: _deviceHeight / 2 * 0.05),
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
                        widget.streetName,
                        style: TextStyle(
                          fontSize: _deviceHeight / 4 * 0.09,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              widget.distance,
                              style: TextStyle(
                                fontSize: _deviceHeight / 4 * 0.09,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 10),
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  StoreCardItem(
                    deviceHeight: _deviceHeight,
                    foodName: 'Fruit salad mix',
                    price: '20.000',
                  ),
                  StoreCardItem(
                    deviceHeight: _deviceHeight,
                    foodName: 'Fruit salad mix choco',
                    price: '20.000',
                  ),
                  // Container(
                  //   height: _deviceHeight / 2 * 0.3,
                  //   child: ListView.builder(
                  //       key: ValueKey(food.foods.keys),
                  //       itemCount: food.foods.length,
                  //       itemBuilder: (context, index) {
                  //         // return Text('$index');
                  //         return food.foods.values.toList()[index].restoName !=
                  //                 widget.storeName
                  //             ? StoreCardItem(
                  //                 deviceHeight: _deviceHeight,
                  //                 foodName: food.foods.values
                  //                     .toList()[index]
                  //                     .menuName,
                  //                 price: '18.500',
                  //                 // contextParent: widget.parentContext,
                  //               )
                  //             : null;
                  //       }),
                  // ),
                  /////////////
                  // StoreCardItem(
                  //   foodName: 'Fruit salad mix choco Milk',
                  //   price: '20.500',
                  //   // contextParent: widget.parentContext,
                  // ),
                ], // Card ========
              ),
            )
          ],
        ),
      ),
    );
  }
}
