import 'package:flutter/material.dart';
// import '../widgets/new_post.dart';

import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import './menu.dart';
import './resto.dart';

class AddMenu with ChangeNotifier {
  final String key;
  final List<String> menus;

  AddMenu({@required this.key, @required this.menus});
}

class Foods with ChangeNotifier {
  Map<String, Menu> _foods = {
    "1": Menu(
      key: '1',
      restoName: 'Delics Fruit Salad',
      restoAddress: 'Jl. Jaya katwang no 4, Ngasem',
      storeStar: '5.0',
      storeDistance: '1 Km',
      delivery: 'Free delivery',
      imageUrl:
          'assets/images/assorted-sliced-fruits-in-white-ceramic-bowl-1092730.png',
      isfavorite: false,
      itemLeft: 7,
      menuName: 'Salad Mix',
      menuPrize: '22.000',
      menuSalePrize: '7.000',
    ),
    "2": Menu(
      key: '2',
      restoName: 'Delics Fruit Salad',
      restoAddress: 'Jl. Jaya katwang no 4, Ngasem',
      storeStar: '5.0',
      storeDistance: '1 Km',
      delivery: 'Free delivery',
      imageUrl: 'assets/images/katherine-chase-SzBZVEryGY4.png',
      isfavorite: false,
      itemLeft: 7,
      menuName: 'Salad Mix choco',
      menuPrize: '22.000',
      menuSalePrize: '7.000',
    ),
    "3": Menu(
      key: '3',
      restoName: 'Bakso Pak ndut',
      restoAddress: 'Jl. Jaya katwang no 4, Ngasem',
      storeStar: '5.0',
      storeDistance: '1 Km',
      delivery: 'Free delivery',
      imageUrl:
          'assets/images/assorted-sliced-fruits-in-white-ceramic-bowl-1092730.png',
      isfavorite: false,
      itemLeft: 7,
      menuName: 'ini bakso',
      menuPrize: '22.000',
      menuSalePrize: '7.000',
    ),
    "4": Menu(
      key: '4',
      restoName: 'Bakso Pak ndut',
      restoAddress: 'Jl. Bagawanta bhari no 12, Ngasem',
      storeStar: '5.0',
      storeDistance: '1 Km',
      delivery: 'Free delivery',
      imageUrl:
          'assets/images/assorted-sliced-fruits-in-white-ceramic-bowl-1092730.png',
      isfavorite: false,
      itemLeft: 7,
      menuName: 'Bakso',
      menuPrize: '22.000',
      menuSalePrize: '7.000',
    ),
  };
  Map<String, Menu> get foods {
    return {..._foods};
  }
}
