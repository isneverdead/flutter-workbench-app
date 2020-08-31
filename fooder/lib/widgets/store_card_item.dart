import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/my_icons.dart';
import '../styles/my_images.dart';

class StoreCardItem extends StatefulWidget {
  final String foodName;
  final String price;

  // final BuildContext contextParent;
  final double deviceHeight;

  StoreCardItem({
    @required this.foodName,
    @required this.price,
    // @required this.contextParent,
    @required this.deviceHeight,
  });
  @override
  _StoreCardItemState createState() => _StoreCardItemState();
}

class _StoreCardItemState extends State<StoreCardItem> {
  var _itemLeft = 5;
  var _count = 0;
  void _incrementItem() {
    setState(() {
      _itemLeft -= 1;
      _count += 1;
    });
  }

  void _decrementItem() {
    setState(() {
      _itemLeft += 1;
      _count -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var _deviceHeight = MediaQuery.of(context).size.height;
    var _deviceHeight = widget.deviceHeight;
    ScrollController titleScrollController = ScrollController();

    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        // padding: EdgeInsets.only(bottom: 10),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(imagesFruitSaladMix),
                                fit: BoxFit.fill)),
                        child: Container(
                            // color: Colors.red,
                            )),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 90,
                      height: 110,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 3, right: 3, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white, width: 3)),
                        child: Text('$_itemLeft Left',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: _deviceHeight / 4 * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: _deviceHeight / 4 * 0.02,
                    ),
                    Container(
                      width: _deviceHeight / 4 * 0.6,
                      height: _deviceHeight / 4 * 0.23,
                      child: Text(
                        '${widget.foodName}',
                        style: TextStyle(
                            fontSize: _deviceHeight / 4 * 0.1,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.price}',
                          style: TextStyle(fontSize: _deviceHeight / 4 * 0.09),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '18.500',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          width: _deviceHeight / 4 * 0.1,
                          height: _deviceHeight / 4 * 0.1,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).accentColor),
                          child: Text(
                            '%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          'Free delivery',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: _deviceHeight / 4 * 0.2,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                alignment: Alignment.topRight,
                child: SvgPicture.asset(iconFavorite),
              )
            ],
          ),
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.grey[100],
              // padding: EdgeInsets.all(0),
              child: _count == 0
                  ? GestureDetector(
                      onTap: () => _incrementItem(),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 7, right: 15),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'Add',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _deviceHeight / 4 * 0.09),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5)),
                          // color: Colors.grey[200],
                          child: IconButton(
                            onPressed: () => _decrementItem(),
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        Container(
                          color: Colors.grey[100],
                          width: _deviceHeight / 4 * 0.2,
                          height: _deviceHeight / 4 * 0.2,
                          alignment: Alignment.center,
                          child: Text('$_count'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          // color: Theme.of(context).primaryColor,
                          child: IconButton(
                            onPressed: () => _incrementItem(),
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        )
      ],
    );
  }
}
