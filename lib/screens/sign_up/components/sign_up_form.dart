import 'package:flutter/material.dart';


import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';
import '../../complete_profile/complete_profile_screen.dart';
import '../cubit/cubit.dart';


class SignUpForm extends StatelessWidget {
   SignUpForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
   TextEditingController? emailController = TextEditingController();
   TextEditingController? passwordController = TextEditingController();
   TextEditingController? phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                ShopRegisterCubit.get(context).userRegister(
                    email: emailController!.text,
                    password: passwordController!.text,
                    phone: phoneController!.text
                );
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: phoneController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText:
            "Enter your phone",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 6) {
          return kShortPassError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
         floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}