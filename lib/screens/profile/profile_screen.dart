import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../components/custom_btn_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';
import '../sign_in/cubit/cubit.dart';
import '../sign_in/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Profile"),
            ),
            body: const Body(),
            bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.profile),
          );
        },
      ),
    );
  }
}
