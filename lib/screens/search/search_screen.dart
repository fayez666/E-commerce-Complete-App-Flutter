import 'package:flutter/material.dart';

import '../../components/cubit/cubit.dart';
import '../../shared/size_config.dart';
import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static String routeName = "/search";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
