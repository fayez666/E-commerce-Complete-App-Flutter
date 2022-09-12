import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/home.dart';
import '../../../shared/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(8),
            vertical: getProportionateScreenHeight(8)),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          //color: const Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CarouselSlider(
          items: model.data!.banners.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: double.infinity,
                image: NetworkImage('${e.image}'),
                fit: BoxFit.cover,
                height: 90,

              ),
            );
          }).toList(),
          options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal),
        ),
      ),
    );
  }
}
