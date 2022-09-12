import 'package:e_commerce_complete_app/components/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../enums.dart';
import '../../models/cart.dart';
import '../../models/categories_model.dart';
import '../../models/change_favorites.dart';
import '../../models/favorites.dart';
import '../../models/home.dart';
import '../../models/order.dart';
import '../../models/search.dart';
import '../../models/sign_in.dart';
import '../../shared/constants.dart';
import '../../shared/end_points.dart';
import '../../shared/local/cache_helper.dart';
import '../../shared/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  HomeModel? homeModel;
  Map<int, bool>? favourites = {};

  var nameController = TextEditingController();
  var regionController = TextEditingController();
  var notesController = TextEditingController();
  var detailsController = TextEditingController();
  String selectedCity = 'Cairo';

  Payments paymentWay = Payments.cache;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products.forEach((element) {
        favourites!.addAll({
          element.id!: element.inFavorites!,
        });
      });

      //print(favourites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState());
      //print(error.toString());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      // print(value.data);

      categoriesModel = CategoriesModel.fromJson(value.data);

      //
      //printFullText(categoriesModel.toString());
      //
      //print(categoriesModel!.status);

      emit(ShopSuccessCategoryState());
    }).catchError((error) {
      emit(ShopErrorCategoriesState());

      // print(error.toString());
    });
  }

  ChangeFavModel? changeFavModel;

  void changeFavorites(int? productId) {
    favourites![productId!] = !favourites![productId]!;
    emit(ShopLoadingChangeFavoritesState());
    DioHelper.postData(
            url: FAVORITES, data: {'product_id': productId}, token: token)
        .then((value) {
      changeFavModel = ChangeFavModel.fromJson(value.data);
      //print(value.data);

      if (!changeFavModel!.status!) {
        favourites![productId] = !favourites![productId]!;
      }
      emit(ShopSuccessChangeFavoritesState(changeFavModel!));
    }).catchError((error) {
      emit(ShopErrorChangeFavoritesState());
    });
  }

  SearchModel? searchModel;

  void search(String text) {
    emit(ShopLoadingSearchState());
    emit(ShopLoadingSearch());
    DioHelper.postData(url: SEARCH, token: token, data: {
      'text': text,
    }).then((value) {
      //print("///////////////////////////////////////");
      //print(value.data);
      searchModel = SearchModel.fromJson(value.data);
      emit(ShopSuccessSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorSearchState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavoritesData() {
    emit(ShopSuccessLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      //print(value.data);
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      //print(favoritesModel!);

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      emit(ShopErrorGetFavoritesState());

      // print(error.toString());
    });
  }

  void deleteFavorites(int id) {
    DioHelper.postData(
      url: 'favorites/$id',
      token: token,
      data: {'product_id': id},
    ).then((value) {
      print("/////////////////////////////");
      print("Delete function");
      print(value.data);
      if (value.data['status']) {
        getFavoritesData();
        emit(DeleteFavoritesSuccessState());
      } else {
        emit(DeleteFavoritesErrorState(value.data['message']));
      }
    }).catchError((error) {
      print(error.toString());
      emit(DeleteFavoritesErrorState(error.toString()));
    });
  }

  CartsModel? cartModel;
  Map<int, bool> inCartList = {};
  Map<int, int> cartItemsQuantity = {};
  int numberInCart = 0;
  int cartsNumber = 0;

  void addToInCartList(int id) {
    if (!inCartList.containsKey(id)) {
      inCartList[id] = true;
    } else {
      inCartList[id] = !inCartList[id]!;
    }
  }

  void getCarts() {
    emit(GetCartsLoadingState());
    DioHelper.getData(
      url: CARTS,
      token: token,
    ).then((value) {
      // print(value.data);
      cartModel = CartsModel.fromJson(value.data);

      if (cartModel!.status) {
        cartItemsQuantity = {};
        numberInCart = 0;
        cartsNumber = cartModel!.data!.cartsItems.length;
        // print('carts=${cartModel!.data!.cartsItems.length}');
        cartModel!.data!.cartsItems.forEach((element) {
          cartItemsQuantity.addAll({element.id: element.quantity});
          numberInCart += element.quantity;
        });
        emit(GetCartsSuccessState());
      } else {
        // print('else block get carts error state');
        emit(GetCartsErrorState());
      }
    }).catchError((error) {
      // print('catch block get carts error state');
      // print(error.toString());
      emit(GetCartsErrorState(message: error.toString()));
    });
  }

  void addProductToCart(int productId) {
    emit(AddCartLoadingState());
    DioHelper.postData(
      url: CARTS,
      token: token,
      data: {"product_id": productId},
    ).then((value) {
      if (value.data['status']) {
        getCarts();
        emit(AddCartSuccessState(message: value.data['message']));
      } else {
        emit(AddCartErrorState(message: value.data['message']));
      }
    }).catchError((error) {
      // print(error.toString());
      emit(AddCartErrorState(message: error.toString()));
    });
  }

  void deleteCart(int id) {
    DioHelper.deleteData(
      url: 'carts/$id',
      token: token,
      language: CacheHelper.getData(key: 'lang').toString(),
    ).then((value) {
      // print("/////////////////////////////");
      // print("Delete function");
      // print(value.data);
      if (value.data['status']) {
        getCarts();
        emit(DeleteCartSuccessState());
      } else {
        emit(DeleteCartErrorState(value.data['message']));
      }
    }).catchError((error) {
      print(error.toString());
      emit(DeleteCartErrorState(error.toString()));
    });
  }

  LoginModel? userModel;

  void getUserData() {
    emit(ShopSuccessLoadingUserDataState());
    print("getUserData");
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      print(value.data);

      userModel = LoginModel.fromJson(value.data);
      print("////////////////////////////");
      print(userModel);
      print("////////////////////////////");

      printFullText(value.data.toString());

      print("model : ${userModel!.data!.name!}");

      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      emit(ShopErrorUserDataState());

      print(error.toString());
    });
  }

  AddOrderModel? addOrderModel;
  int addressId = 0;

  void addNewOrder({int? addressId, context}) {
    emit(AddOrderLoadingState());
    DioHelper.postData(
            url: ORDERS,
            data: {
              'address_id': addressId,
              "payment_method": 1,
              "use_points": false,
            },
            token: token)
        .then((value) {
      addOrderModel = AddOrderModel.fromJson(value.data);
      if (addOrderModel!.status) {
        getCarts();
        getOrders();
        emit(AddOrderSuccessState(addOrderModel!));
      } else {
        getCarts();
        getOrders();
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(AddOrderErrorState(error));
    });
  }

  GetOrderModel? orderModel;

  void getOrders() {
    emit(GetOrdersLoadingState());
    DioHelper.getData(
        url: ORDERS,
        token: token).then((orders) {
      orderModel = GetOrderModel.fromJson(orders.data);
      ordersDetails.clear();
      ordersIds.clear();
      for (var element in orderModel!.data.data) {
        ordersIds.add(element.id);
      }
      emit(GetOrdersSuccessState(orderModel!));
      getOrdersDetails();
    }).catchError((error) {
      emit(GetOrdersErrorState(error));
      if (kDebugMode) {
        print('Get Orders Error ${error.toString()}');
      }
    });
  }

  List<int> ordersIds = [];
  OrderDetailsModel? orderItemDetails;
  List<OrderDetailsModel> ordersDetails = [];

  void getOrdersDetails() async {
    emit(OrderDetailsLoadingState());
    if (ordersIds.isNotEmpty) {
      for (var id in ordersIds) {
        await DioHelper.getData(url: "$ORDERS/$id", token: token)
            .then((orderDetails) {
          orderItemDetails = OrderDetailsModel.fromJson(orderDetails.data);
          ordersDetails.add(orderItemDetails!);
          emit(OrderDetailsSuccessState(orderItemDetails!));
        }).catchError((error) {
          emit(OrderDetailsErrorState(error));
          if (kDebugMode) {
            print('Get Orders Details Error ${error.toString()}');
          }
          return;
        });
      }
    }
  }

  CancelOrderModel? cancelOrderModel;

  void cancelOrder({required int id}) {
    emit(CancelOrderLoadingState());
    DioHelper.getData(url: "orders/$id/cancel", token: token).then((value) {
      cancelOrderModel = CancelOrderModel.fromJson(value.data);
      getOrders();
      emit(CancelOrderSuccessState(cancelOrderModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CancelOrderErrorState(error));
    });
  }
}
