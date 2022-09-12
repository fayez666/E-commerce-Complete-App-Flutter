import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../my_account/components/profile_menu.dart';
import '../../my_account/components/profile_picture.dart';
import '../../my_account/my_account_screen.dart';


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
          text: "My Account",
          press: () {
            Navigator.pushNamed(context, MyAccountScreen.routeName);
          },
        ),
        ProfileMenu(
          icon: 'assets/icons/Bell.svg',
          text: "Notifications",
          press: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Settings.svg',
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Question mark.svg',
          text: "Help Center",
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
