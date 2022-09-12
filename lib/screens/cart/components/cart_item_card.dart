import 'package:flutter/material.dart';

import '../../../components/cubit/cubit.dart';
import '../../../shared/constants.dart';
import '../../../models/cart.dart';
import '../../../shared/size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cart,
    required this.index,
  }) : super(key: key);

  final CartsModel cart;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(
                image: NetworkImage(ShopCubit.get(context)
                    .cartModel!
                    .data!
                    .cartsItems[index]
                    .product
                    .image!),
              ),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ShopCubit.get(context)
                    .cartModel!
                    .data!
                    .cartsItems[index]
                    .product
                    .name!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "\$${ShopCubit.get(context).cartModel!.data!.cartsItems[index].product.price!}",
                  style: const TextStyle(color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${ShopCubit.get(context).numberInCart}",
                        style: const TextStyle(color: kTextColor))
                  ])),
            ],
          ),
        )
      ],
    );
  }
}
