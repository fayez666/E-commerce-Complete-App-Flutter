import 'package:e_commerce_complete_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../components/social_card.dart';
import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
                "Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
               SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children:  [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: (){},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: (){},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: (){},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
