import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooder/screen/checkout_screen.dart';
import 'package:fooder/screen/home_screen.dart';
import '../widgets/appbar_promo.dart';
import '../widgets/store_card.dart';
import '../styles/my_icons.dart';
import 'package:provider/provider.dart';

import '../providers/foods.dart';

class PromoScreen extends StatefulWidget {
  static const routeName = '/promo-screen';
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final food = Provider.of<Foods>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            color: Colors.white,
            // margin: EdgeInsets.only(top: 0, left: 0),
            padding: EdgeInsets.only(top: 50, left: 10, bottom: 0, right: 0),
            height: deviceHeight / 2 * 0.429,
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 55),
                          child: Text(
                            'Today\'s Promo',
                            style: TextStyle(
                                fontSize: deviceHeight / 4 * 0.17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                        },
                        child: SvgPicture.asset(iconArrowLeft),
                      ),
                    ),
                  ],
                ),
                AppBarPromo(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: deviceHeight / 4 * 0.05, right: deviceHeight / 4 * 0.05),
            height: deviceHeight * 0.7,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      // itemCount: 1,
                      itemCount: food.foods.length,
                      key: ValueKey(food.foods.keys),
                      itemBuilder: (context, index) {
                        return StoreCard(
                          // keyItem: food.foods.values.toList()[index].key,
                          deviceHeight: deviceHeight,
                          // parentContext: context,
                          storeName:
                              food.foods.values.toList()[index].restoName,
                          streetName:
                              food.foods.values.toList()[index].restoAddress,
                          distance:
                              food.foods.values.toList()[index].storeDistance,
                          star: food.foods.values.toList()[index].storeStar,
                        );
                        // if (food.foods.values.toList()[index].restoName !=
                        //     food.foods.values
                        //         .toList()[index == food.foods.length - 1
                        //             ? index + 1
                        //             : index]
                        //         .restoName) {
                        //   print(index);
                        //   index = index + 1;
                        //   return StoreCard(
                        //     deviceHeight: deviceHeight,
                        //     // parentContext: context,
                        //     storeName:
                        //         food.foods.values.toList()[index].restoName,
                        //     streetName:
                        //         food.foods.values.toList()[index].restoAddress,
                        //     distance:
                        //         food.foods.values.toList()[index].storeDistance,
                        //     star: food.foods.values.toList()[index].storeStar,
                        //   );
                        // }
                        // if (index >= 0 && index != food.foods.length - 1) {
                        //   index = index + 1;
                        // } else if (index == food.foods.length - 1) {
                        //   return null;
                        // }
                        // // index =
                        // //     index == food.foods.length - 1 ? index : ;
                        // print(index);
                        // return index > 0 &&
                        //         food.foods.values.toList()[index].restoName ==
                        //             food.foods.values
                        //                 .toList()[index == food.foods.length - 1
                        //                     ? index
                        //                     : index + 1]
                        //                 .restoName
                        // ? StoreCard(
                        //     deviceHeight: deviceHeight,
                        //     // parentContext: context,
                        //     storeName:
                        //         food.foods.values.toList()[index].restoName,
                        //     streetName: food.foods.values
                        //         .toList()[index]
                        //         .restoAddress,
                        //     distance: food.foods.values
                        //         .toList()[index]
                        //         .storeDistance,
                        //     star:
                        //         food.foods.values.toList()[index].storeStar,
                        //   )
                        // : index = index + 1;
                      }),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),

          //
        ],
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
              Navigator.of(context).pushNamed(CheckoutScreen.routeName);
            },
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
