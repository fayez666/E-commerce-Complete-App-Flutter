
import 'package:flutter/widgets.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/check_out/check_out_screen.dart';
import '../screens/complete_profile/complete_profile_screen.dart';
import '../screens/details/details_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/forgot_password/forgot_password.dart';
import '../screens/home/home_screen.dart';
import '../screens/login_success/login_sucess_screen.dart';
import '../screens/my_account/my_account_screen.dart';
import '../screens/otp/otp_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/sign_in/sign_in.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/splash/splash_screen.dart';



final Map<String,WidgetBuilder> routes={
  SplashScreen.routeName :(context)=>const SplashScreen(),
  SignInScreen.routeName :(context)=> SignInScreen(),
  ForgotPasswordScreen.routeName :(context)=>const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName :(context)=>const LoginSuccessScreen(),
  SignUpScreen.routeName :(context)=> const SignUpScreen(),
  CompleteProfileScreen.routeName :(context)=>const CompleteProfileScreen(),
  OtpScreen.routeName : (context)=> const OtpScreen(),
  HomeScreen.routeName : (context)=> const HomeScreen(),
  DetailsScreen.routeName : (context)=> DetailsScreen(),
  CartScreen.routeName :(context)=>const CartScreen(),
  ProfileScreen.routeName :(context)=>const ProfileScreen(),
  SearchScreen.routeName :(context)=>const SearchScreen(),
  FavoritesScreen.routeName :(context)=>const FavoritesScreen(),
  CheckOutScreen.routeName :(context)=> CheckOutScreen(),
  MyAccountScreen.routeName :(context)=> const MyAccountScreen(),
};