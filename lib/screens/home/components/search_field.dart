import 'package:flutter/material.dart';

import '../../../components/cubit/cubit.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';
import '../../search/search_screen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        width: SizeConfig.screenWidth * 0.6,
        //height: 50,
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller: searchController,
          onChanged: (value) {},
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Product",
              prefixIcon: const Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(9))),
          onFieldSubmitted: (text){
            // print("/////////////////////////");
            // print(text);
            Navigator.pushNamed(context, SearchScreen.routeName);
            ShopCubit.get(context).search(text);
          },
        ),
      ),
    );
  }
}
