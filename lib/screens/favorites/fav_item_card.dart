import 'package:flutter/material.dart';

import '../../components/cubit/cubit.dart';
import '../../shared/constants.dart';
import '../../shared/size_config.dart';

class FavItemCard extends StatelessWidget {
  FavItemCard({
    Key? key,required this.index
  }) : super(key: key);
int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal : getProportionateScreenWidth(20)),
      child: Row(
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
                  image: NetworkImage(
                      '${ShopCubit.get(context).favoritesModel!.data!.data![index].product!.image}'),
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
                      .favoritesModel!
                      .data!
                      .data![index]
                      .product!
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
                    text:
                    "\$${ShopCubit.get(context).favoritesModel!.data!.data![index].product!.price}",
                    style: const TextStyle(color: kPrimaryColor),
                    children: const [
                      TextSpan(
                          text: " x1",
                          style: TextStyle(color: kTextColor))
                    ])),
              ],
            ),
          ),
          IconButton(onPressed: (){
            ShopCubit.get(context).deleteFavorites(ShopCubit.get(context).favoritesModel!.data!.data![index].product!.id!);
          },
            icon: const Icon(Icons.favorite),),
        ],
      ),
    );
  }
}
