import 'package:flutter/material.dart';

import '../../../components/cubit/cubit.dart';
import '../../../shared/constants.dart';
import '../../profile/components/profile_menu.dart';
import '../../profile/components/profile_picture.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePicture(),
        const SizedBox(
          height: 20,
        ),
        ProfileMenu(
          icon: 'assets/icons/User Icon.svg',
          text: "${ShopCubit.get(context).userModel!.data!.name}",
          press: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Mail.svg',
          text: "${ShopCubit.get(context).userModel!.data!.email}",
          press: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Log out.svg',
          text: "Log Out",
          press: () {
            signOut(context);
           },
        ),
      ],
    );
  }
}
