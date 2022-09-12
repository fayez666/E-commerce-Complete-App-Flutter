import 'package:flutter/material.dart';


import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight*0.04,),
            Text(
              "Forgot Password",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Please enter your email and we will send \nyou a link to return to your account",
              textAlign: TextAlign.center,
            ),
            const ForgotPassForm(),
          ],
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey =GlobalKey<FormState>();
  String? email;
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
          child: Column(
      children: [
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) =>  email= newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return;
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg')),
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(
            errors: errors,
          ),
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          DefaultButton(
            text: 'Continue',
            press: () {
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          const NoAccountText(),
      ],
    ),
        ));
  }
}
