import 'package:e_commerce_complete_app/screens/home/components/popular_product.dart';
import 'package:e_commerce_complete_app/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';
import '../../../components/cubit/cubit.dart';
import '../../../shared/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';

import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const HomeHeader(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DiscountBanner(
              model: ShopCubit.get(context).homeModel!,
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Categories(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const SpecialOffers(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const PopularProduct(),
          ],
        ),
      ),
    );
  }
}
