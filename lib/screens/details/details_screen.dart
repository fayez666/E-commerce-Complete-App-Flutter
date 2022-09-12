import 'package:flutter/material.dart';
import '../../components/cubit/cubit.dart';
import '../../models/home.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
    DetailsScreen({  this.model , Key? key,}) : super(key: key);
  static String routeName = "/details"; // you should delete this
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          ShopCubit.get(context).homeModel!.data!.products[1]
        ),
      ),
      body: Body(
        product:model!
        ,
      ),
    );
  }
}

