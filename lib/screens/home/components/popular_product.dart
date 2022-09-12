import 'package:e_commerce_complete_app/screens/home/components/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../components/cubit/cubit.dart';
import '../../../components/cubit/states.dart';
import '../../../components/product_card.dart';
import '../../../shared/size_config.dart';
import '../../details/details_screen.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return Column(
          children: [
            SectionTitle(
              text: "Popular Products",
              press: () {},
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    ShopCubit.get(context).homeModel!.data!.products.length,
                        (index) => ProductCard(
                      index: index,
                      press: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsScreen(model : ShopCubit.get(context).homeModel!.data!.products[index]) ));
                        // Navigator.pushNamed(context,DetailsScreen.routeName);
                      },
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
