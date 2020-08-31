import 'package:flutter/material.dart';
import './image_slider_item.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ImageSliderItem(),
            ImageSliderItem(),
            ImageSliderItem(),
            ImageSliderItem(),
          ],
        ),
      ),
    );
  }
}
