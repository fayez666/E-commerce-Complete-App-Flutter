import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/cubit/cubit.dart';
import '../../../components/cubit/states.dart';
import '../../../shared/size_config.dart';
import '../fav_item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        log("favorites ${cubit.favoritesModel?.data}");
        if (cubit.favoritesModel?.data != null &&
            cubit.favoritesModel!.data!.data!.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ConditionalBuilder(
              condition: state is! ShopSuccessLoadingGetFavoritesState,
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Dismissible(
                  key: Key(ShopCubit.get(context).favoritesModel!.data!.data![index].product!.id.toString()),
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
                  onDismissed: (direction){
                    ShopCubit.get(context).favoritesModel!.data!.data!.removeAt(index);
                    // ShopCubit.get(context).changeFavorites(ShopCubit.get(context).favoritesModel!.data!.data![index].product!.id!);
                  },
                  child: FavItemCard(index: index),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                itemCount:
                    ShopCubit.get(context).favoritesModel!.data!.data!.length,
              ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Favourite is empty add Items',
            ),
          ),
        );
      },
    );
  }
}

