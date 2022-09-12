import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/constants.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        padding: const EdgeInsets.all(20),
        onPressed: press,
        color: const Color(0xFFF5F6F9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: kPrimaryColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
