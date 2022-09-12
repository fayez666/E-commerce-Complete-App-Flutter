import 'package:flutter/material.dart';

import '../../../components/cubit/cubit.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';
import '../../cart/cart_screen.dart';
import '../../home/components/icon_btn_with_counter.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.6,
          //height: 50,
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {},
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search Product",
                prefixIcon: const Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(9))),
            onFieldSubmitted: (text){
            },
          ),
        ),
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
    );
  }
}
