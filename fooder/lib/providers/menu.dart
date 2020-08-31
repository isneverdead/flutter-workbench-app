import 'package:flutter/material.dart';

class Menu with ChangeNotifier {
  final String key;
  final String restoName;
  final String restoAddress;
  final String storeStar;
  final String storeDistance;
  final String menuName;
  final String menuPrize;
  final String menuSalePrize;
  final String delivery;
  final bool isfavorite;
  final int itemLeft;
  final String imageUrl;

  Menu({
    @required this.key,
    @required this.menuName,
    @required this.menuPrize,
    @required this.menuSalePrize,
    @required this.delivery,
    @required this.isfavorite,
    @required this.itemLeft,
    @required this.imageUrl,
    @required this.restoName,
    @required this.restoAddress,
    @required this.storeStar,
    @required this.storeDistance,
  });
}
