import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shared/constants.dart';
import '../shared/size_config.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.index,
    required this.press,
  }) : super(key: key);
  final double? width, aspectRatio;
  final GestureTapCallback press;
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){
        if(state is ShopSuccessChangeFavoritesState){
          if(!state.model.status!){
            Fluttertoast.showToast(
                msg: "${state.model.message}",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (context,state){
        return  Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          child: GestureDetector(
            onTap: press,
            child: SizedBox(
              width: getProportionateScreenWidth(width!),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: aspectRatio!,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Image(
                        image: NetworkImage(
                            cubit.homeModel!.data!.products[index].image!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${cubit.homeModel!.data!.products[index].name}',
                    style: const TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cubit.homeModel!.data!.products[index].price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                            color: kPrimaryColor),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeFavorites(
                              cubit.homeModel!.data!.products[index].id);
                          },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: getProportionateScreenWidth(28),
                          height: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                              color: cubit.favourites![
                              cubit.homeModel!.data!.products[index].id]!
                                  ? kPrimaryColor.withOpacity(0.15)
                                  : kSecondaryColor.withOpacity(0),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/icons/Heart Icon_2.svg',
                            color: cubit.favourites![cubit.homeModel!.data!.products[index].id]!
                                ? const Color(0xFFFF4848)
                                : const Color(0xFFDBDEE4),
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
