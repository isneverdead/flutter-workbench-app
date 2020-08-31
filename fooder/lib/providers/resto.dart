import 'package:flutter/material.dart';
import './menu.dart';

class Resto with ChangeNotifier {
  final String restoName;
  final String restoAddress;
  final String storeStar;
  final String storeDistance;
  Map<String, Menu> menu = {};
  Resto({
    @required this.restoName,
    @required this.restoAddress,
    @required this.storeStar,
    @required this.storeDistance,
    @required this.menu,
  });
}
