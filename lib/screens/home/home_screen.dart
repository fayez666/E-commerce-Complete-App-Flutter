import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../components/cubit/cubit.dart';
import '../../components/cubit/states.dart';
import '../../components/custom_btn_nav_bar.dart';
import '../../enums.dart';
import '../../shared/constants.dart';
import '../../shared/size_config.dart';
import '../home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&ShopCubit.get(context).categoriesModel !=null,
            builder: (context) => const Body(),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            )),
          ),
          bottomNavigationBar:
              const CustomBottomNavBar(selectedMenu: MenuState.home),
        );
      },
    );
  }
}
