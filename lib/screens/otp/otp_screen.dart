import 'package:flutter/material.dart';

import '../otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static String routeName ="/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("OTP Verification"),
      ),
      body: const Body(),
    );
  }
}
