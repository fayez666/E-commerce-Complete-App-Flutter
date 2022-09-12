
import '../../../models/sign_in.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialState extends ShopLoginStates{}

class ShopLoginLoadingState extends ShopLoginStates{}

class ShopLoginSuccessState extends ShopLoginStates{
 final LoginModel loginModel;
 ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates{
  final String error;

  ShopLoginErrorState(this.error);
}

class ShopLOgOutLoadingState extends ShopLoginStates{}

class ShopLOgOutSuccessState extends ShopLoginStates{

}

class ShopLOgOutErrorState extends ShopLoginStates{
  final String error;

  ShopLOgOutErrorState(this.error);
}