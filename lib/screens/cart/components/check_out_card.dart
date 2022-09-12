import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/cubit/cubit.dart';
import '../../../components/cubit/states.dart';
import '../../../components/default_button.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';
import '../../check_out/check_out_screen.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
              vertical: getProportionateScreenWidth(15)),
          height: 174,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -15),
                  blurRadius: 20,
                  color: const Color(0xFFDADADA).withOpacity(0.15),
                )
              ]),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset('assets/icons/receipt.svg'),
                    ),
                    const Spacer(),
                    const Text("Add voucher code"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kTextColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(text: "Total:\n", children: [
                      TextSpan(
                          text:
                              "\$${ShopCubit.get(context).cartModel!.data!.total!}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black))
                    ])),
                    SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: DefaultButton(
                        text: "Check Out",
                        press: () {
                          Navigator.pushNamed(
                              context, CheckOutScreen.routeName);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
