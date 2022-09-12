import 'package:e_commerce_complete_app/screens/home/components/title_section.dart';
import 'package:flutter/material.dart';

import '../../../shared/size_config.dart';
import '../../../components/cubit/cubit.dart';


class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Special for you",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                ShopCubit.get(context).categoriesModel!.data!.data.length,
                    (index) =>SpecialOfferCard(
                      index: index,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,  this.index,

  }) : super(key: key);
 final int? index;
  @override
  Widget build(BuildContext context) {
    var cubit =ShopCubit.get(context).categoriesModel;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenHeight(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image(image: NetworkImage(cubit!.data!.data[index!].image!),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF343434).withOpacity(0.4),
                          const Color(0xFF343434).withOpacity(0.15),
                        ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenHeight(10)),
                child: Text.rich(TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                          text: cubit.data!.data[index!].name,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          )),
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
