import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_complete_app/screens/search/components/search_header.dart';
import 'package:flutter/material.dart';

import '../../../components/cubit/cubit.dart';
import '../../../components/cubit/states.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';

class Body extends StatelessWidget {
  Body({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var cubit = ShopCubit.get(context);
    return Form(
      key: formKey,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SearchHeader(searchController: searchController),
                ConditionalBuilder(
                  condition: cubit.state is! ShopLoadingSearchState,
                  builder: (context) {
                    return ListView.separated(
                      itemCount:cubit.searchModel!.data!.data!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context , int) => const SizedBox(height: 15) ,
                      itemBuilder: (context, index) {
                        return SearchItem(
                          index: index,
                        );
                      },
                    );
                  },
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int? index;

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
                    .searchModel!
                    .data!
                    .data![index!]
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
                ShopCubit.get(context).searchModel!.data!.data![index!].name!,
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
                      "\$${ShopCubit.get(context).searchModel!.data!.data![index!].price!}",
                  style: const TextStyle(color: kPrimaryColor),
                  children: const [
                    TextSpan(text: "x2", style: TextStyle(color: kTextColor))
                  ])),
            ],
          ),
        )
      ],
    );
  }
}
