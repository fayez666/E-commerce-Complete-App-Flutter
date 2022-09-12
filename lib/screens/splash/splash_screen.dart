import 'package:flutter/material.dart';

import '../../shared/size_config.dart';
import 'components/body.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      body: Body(),
    );
  }
}
