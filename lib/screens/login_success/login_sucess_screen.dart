import 'package:flutter/material.dart';

import 'components/body.dart';


class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  static String routeName ="/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const  SizedBox(),
        centerTitle: true,
        title: const Text("Login Success"),
      ),
      body: const Body(),
    );
  }
}
