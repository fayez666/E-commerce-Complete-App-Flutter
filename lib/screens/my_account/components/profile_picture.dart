import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          Positioned(
            right: -15,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: MaterialButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white)
                  ),
                  color: const Color(0xFFF5F6F9),
                  onPressed: () {},
                  child: SvgPicture.asset('assets/icons/Camera Icon.svg')),
            ),
          )
        ],
      ),
    );
  }
}
