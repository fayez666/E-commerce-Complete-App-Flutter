import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../../components/cubit/cubit.dart';
import '../../../components/cubit/states.dart';
import '../../../components/default_button.dart';
import '../../../enums.dart';
import '../check_out_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.cubit,
    required this.formKey,
    required this.cities,
  }) : super(key: key);

  final ShopCubit cubit;
  final GlobalKey<FormState> formKey;
  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Conditional.single(
        context: context,
        conditionBuilder: (context) =>
        cubit.cartModel!.data!.cartsItems.isNotEmpty,
        widgetBuilder: (context) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Billing details',
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // name text field
                      InputTextField(
                        title: 'Name',
                        controller: cubit.nameController,
                        validateText: 'Name is required',
                      ),
                      Row(
                        children: const [
                          Text('City'),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.red,
                            size: 10,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: DropdownButtonFormField(
                          items: cities.map(
                                (String city) {
                              return DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              );
                            },
                          ).toList(),
                          value: cubit.selectedCity,
                          onChanged: (String? city) {
                            // cubit.changeCurrentCity(city!);
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.fromLTRB(10, 16, 10, 16),
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
                        ),
                      ),
                      // region text field
                      InputTextField(
                        title: 'Region',
                        controller: cubit.regionController,
                        validateText: 'Region is required',
                      ),
                      // details text field
                      InputTextField(
                        title: 'Details',
                        controller: cubit.detailsController,
                        validateText: 'Details is required',
                      ),
                      // order notes
                      InputTextField(
                        title: 'Order Notes',
                        controller: cubit.notesController,
                        isOptional: true,
                        isNotes: true,
                      ),
                    ],
                  ),
                ),
                // your order text
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Your Order',
                  ),
                ),
                reusableContainer(
                  'Product',
                  'Subtotal',
                  context,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildBillItem(
                      cubit.cartModel!.data!.cartsItems[index], index),
                  separatorBuilder: (context, index) => Container(),
                  itemCount: cubit.cartModel!.data!.cartsItems.length,
                ),
                reusableContainer('SubTotal',
                    '${cubit.cartModel!.data!.subTotal}\$', context),
                reusableContainer(
                  'Total',
                  '${cubit.cartModel!.data!.total}\$',
                  context,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      RadioListTile<Payments>(
                        title: const Text(
                          'Cache on delivery',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: Payments.cache,
                        groupValue: cubit.paymentWay,
                        onChanged: (Payments? value) {
                          //cubit.changePaymentWay(value!);
                        },
                      ),
                      RadioListTile<Payments>(
                        title: const Text(
                          'Online Payments',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: Payments.online,
                        groupValue: cubit.paymentWay,
                        onChanged: (Payments? value) {
                          //cubit.changePaymentWay(value!);
                        },
                      ),
                    ],
                  ),
                ),
                if (cubit.state is! AddAddressLoadingState)
                  DefaultButton(
                      press: () {
                        if (formKey.currentState!.validate()) {
                          ShopCubit.get(context).addNewOrder();
                        }
                      },
                      text: 'Add Order'),
                if (cubit.state is AddAddressLoadingState)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        fallbackBuilder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultButton(
              text: 'Return To Home',
              press: () {
                // cubit.changeCurrentIndex(0);
                //navigateTo(context: context, nextScreen: MainLayout());
              },
            ),
          ),
        ),
      ),
    );
  }
}

