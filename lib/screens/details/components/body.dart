import 'package:e_commerce_complete_app/screens/details/components/product_description.dart';
import 'package:e_commerce_complete_app/screens/details/components/product_images.dart';
import 'package:e_commerce_complete_app/screens/details/components/top_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../components/cubit/cubit.dart';
import '../../../components/default_button.dart';
import '../../../models/home.dart';
import '../../../shared/size_config.dart';


class Body extends StatelessWidget {
  final ProductModel product;

   Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit =ShopCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product, pressOnSeeMore: () {}),
                TopRoundedContainer(
                    color: const Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                         TopRoundedContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth *0.15,
                                right: SizeConfig.screenWidth *0.15,
                                top: getProportionateScreenWidth(15),
                                bottom: getProportionateScreenWidth(40)
                              ),
                              child: DefaultButton(
                                text: 'Add to Cart',
                                press: (){
                                  cubit.addToInCartList(product.id!);
                                  print(cubit.inCartList);
                                  cubit.addProductToCart(product.id!);
                                  cubit.inCartList[product.id]!=
                                      !cubit.inCartList[product.id]!;
                                },
                              ),
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
