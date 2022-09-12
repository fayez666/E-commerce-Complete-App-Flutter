import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/cubit/cubit.dart';
import '../../../shared/size_config.dart';
import 'cart_item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: ListView.builder(
          itemCount: ShopCubit.get(context).cartModel!.data!.cartsItems.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(ShopCubit.get(context)
                      .cartModel!
                      .data!
                      .cartsItems[index]
                      .product
                      .id
                      .toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset('assets/icons/Trash.svg')
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    ShopCubit.get(context).deleteCart(ShopCubit.get(context)
                        .cartModel!
                        .data!
                        .cartsItems[index].id
                        );
                  },
                  child: CartItemCard(
                    cart: ShopCubit.get(context).cartModel!,
                    index: index,
                  ),
                ),
              )),
    );
  }
}
