import 'package:flutter/material.dart';

import '../../shared/size_config.dart';
import 'components/body.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          const Text(
            "Your Favorites",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
