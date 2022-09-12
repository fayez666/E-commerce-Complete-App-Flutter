
import '../../models/change_favorites.dart';
import '../../models/order.dart';
import '../../models/sign_in.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoryState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopLoadingChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {
  final ChangeFavModel model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopLoadingSearch extends ShopStates {}

class ShopSuccessSearchState extends ShopStates {}

class ShopLoadingSearchState extends ShopStates {}

class ShopErrorSearchState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopSuccessLoadingGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class GetCartsLoadingState extends ShopStates {}

class GetCartsSuccessState extends ShopStates {}

class GetCartsErrorState extends ShopStates {
  String? message;

  GetCartsErrorState({this.message});
}

class AddCartLoadingState extends ShopStates {}

class AddCartSuccessState extends ShopStates {
  String? message;

  AddCartSuccessState({this.message});
}

class AddCartErrorState extends ShopStates {
  String? message;

  AddCartErrorState({this.message});
}

class DeleteCartSuccessState extends ShopStates {}

class DeleteCartErrorState extends ShopStates {
  String? message;

  DeleteCartErrorState(this.message);
}

class DeleteFavoritesSuccessState extends ShopStates {}

class DeleteFavoritesErrorState extends ShopStates {
  String? message;

  DeleteFavoritesErrorState(this.message);
}

class AddAddressLoadingState extends ShopStates {}

class AddAddressSuccessState extends ShopStates {}

class AddAddressErrorState extends ShopStates {
  String? message;

  AddAddressErrorState({this.message});
}

class ShopSuccessUserDataState extends ShopStates {
  final LoginModel loginModel;
  ShopSuccessUserDataState(this.loginModel);
}

class ShopSuccessLoadingUserDataState extends ShopStates {}

class ShopErrorUserDataState extends ShopStates {}

class AddOrderLoadingState extends ShopStates {}

class AddOrderSuccessState extends ShopStates {
  final AddOrderModel addOrderModel;

  AddOrderSuccessState(this.addOrderModel);
}

class AddOrderErrorState extends ShopStates {
  final String error;

  AddOrderErrorState(this.error);
}

class GetOrdersLoadingState extends ShopStates {}

class GetOrdersSuccessState extends ShopStates {
  final GetOrderModel getOrderModel;

  GetOrdersSuccessState(this.getOrderModel);
}

class GetOrdersErrorState extends ShopStates {
  final String error;

  GetOrdersErrorState(this.error);
}

class OrderDetailsLoadingState extends ShopStates {}

class OrderDetailsSuccessState extends ShopStates {
  final OrderDetailsModel orderDetailsModel;

  OrderDetailsSuccessState(this.orderDetailsModel);
}

class OrderDetailsErrorState extends ShopStates {
  final String error;

  OrderDetailsErrorState(this.error);
}

class CancelOrderLoadingState extends ShopStates {}

class CancelOrderSuccessState extends ShopStates {
  final CancelOrderModel cancelOrderModel;

  CancelOrderSuccessState(this.cancelOrderModel);
}

class CancelOrderErrorState extends ShopStates {
  final String error;

  CancelOrderErrorState(this.error);
}


