import 'package:e_commerce_complete_app/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../components/default_button.dart';
import '../../../shared/constants.dart';
import '../../../shared/local/cache_helper.dart';
import '../../../shared/size_config.dart';
import '../../sign_in/sign_in.dart';

class Body extends StatelessWidget {
   Body({Key? key}) : super(key: key);

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  var splashController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                    currentPage == value;
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text']!,
                  image: splashData[index]['image']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SmoothPageIndicator(
                        count: splashData.length,
                        effect: const  ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: kPrimaryColor,
                            dotHeight: 10,
                            dotWidth: 8,
                            expansionFactor: 4,
                            spacing: 5.0),
                        controller: splashController,
                      )
                    ]),
                    const Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        CacheHelper.saveData(key: 'splash', value: true)
                            .then((value) {
                          if (value) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, SignInScreen.routeName, (route) {
                              return false;
                            });
                          }
                        });
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
