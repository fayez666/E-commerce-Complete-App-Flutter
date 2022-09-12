import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/cubit/cubit.dart';
import '../../components/cubit/states.dart';
import '../../models/cart.dart';
import 'components/body.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = '/check';
  var formKey = GlobalKey<FormState>();

  List<String> cities = ['Alex', 'Cairo', 'Aswan', 'Bani Suef', 'Giza', 'Suez'];

  CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // if (state is AddAddressErrorState) {
        //   // showMessageBox(message: state.message!, context: context);
        // }
        // if (state is AddOrderErrorState) {
        //   // showMessageBox(message: state.message!, context: context);
        // }
        // if (state is AddOrderSuccessState) {
        //   showToast(text: state.message!, state:ToastStates.SUCCESS );
        // }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Check out"),
            centerTitle: true,
          ),
          body: Body(cubit: cubit, formKey: formKey, cities: cities),
        );
      },
    );
  }
}

class InputTextField extends StatelessWidget {
  String title;
  String? validateText;
  TextEditingController controller;
  bool isNotes;
  bool isOptional;

  InputTextField({
    required this.title,
    required this.controller,
    this.isOptional = false,
    this.isNotes = false,
    this.validateText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            !isOptional
                ? const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.red,
                    size: 10,
                  )
                : const Text('(optional)'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: TextFormField(
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
              hintText: isNotes
                  ? 'Notes about your order, e.g special notes for delivery'
                  : null,
              contentPadding: isNotes
                  ? const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 10,
                    )
                  : const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: .5,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                  width: .5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey[300]!,
                ),
              ),
            ),
            validator: !isOptional
                ? (String? value) {
                    if (value!.isEmpty) return validateText;
                    return null;
                  }
                : null,
          ),
        ),
      ],
    );
  }
}

Widget buildBillItem(CartItem item, int index) {
  return Container(
    height: 70,
    width: double.infinity,
    color: index % 2 == 0 ? Colors.grey[50] : Colors.grey[100],
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.product.name!,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Text('x${item.quantity}'),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 30),
            child: Text('${item.product.price}\$'),
          ),
        ),
      ],
    ),
  );
}

Widget reusableContainer(String text1, String text2, BuildContext context) {
  return Container(
    height: 70,
    width: double.infinity,
    color: Colors.grey[300],
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              text1,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              text2,
            ),
          ),
        ),
      ],
    ),
  );
}
