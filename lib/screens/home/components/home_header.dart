import 'package:e_commerce_complete_app/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../shared/size_config.dart';
import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
            svgScr: 'assets/icons/Cart Icon.svg',
          ),
          IconBtnWithCounter(
            press: () {

            },
            svgScr: 'assets/icons/Bell.svg',
            numOfItems: 3,
          ),
        ],
      ),
    );
  }
}
