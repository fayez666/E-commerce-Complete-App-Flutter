import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';
import '../../forgot_password/forgot_password.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
    required this.state,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final ShopLoginStates? state ;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Text(
                    "Welcome back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildEmailTextFormField(),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        buildPassTextFormField(),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              activeColor: kPrimaryColor,
                              onChanged: (value) {},
                            ),
                            const Text("Remember me"),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName),
                              child: const Text(
                                "Forgot Password",
                                style:
                                TextStyle(decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => DefaultButton(
                              text: "Continue",
                              press: () {
                                if (_formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController!.text,
                                      password: passwordController!.text);
                                }
                              }),
                          fallback: (context) => const CircularProgressIndicator(color: kPrimaryColor,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: 'assets/icons/google-icon.svg',
                        press: () {},
                      ),
                      SocialCard(
                        icon: 'assets/icons/facebook-2.svg',
                        press: () {},
                      ),
                      SocialCard(
                        icon: 'assets/icons/twitter.svg',
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ));
  }

  TextFormField buildPassTextFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 7) {
          return kShortPassError;
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg')),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg')),
    );
  }
}
