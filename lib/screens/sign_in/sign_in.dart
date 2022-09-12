import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/local/cache_helper.dart';
import '../../shared/size_config.dart';
import 'components/body.dart';
import '../home/home_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.status);
              print(state.loginModel.message);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false);
              });
              Fluttertoast.showToast(
                  msg: "${state.loginModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              print(state.loginModel.message);
              Fluttertoast.showToast(
                  msg: "${state.loginModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text("Sign In")),
            body: Body(
              formKey: _formKey,
              emailController: emailController,
              passwordController: passwordController,
              state: state,
            ),
          );
        },
      ),
    );
  }
}
