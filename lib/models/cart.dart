

import 'home.dart';

class CartsModel {
  late bool status;
  String? message;
  CartsDetails? data;

  CartsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CartsDetails.fromJson(json['data']) : null;
  }
}

class CartsDetails {
  dynamic subTotal;
  dynamic total;
  List<CartItem> cartsItems = [];
  CartsDetails.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    total = json['total'];
    for (var cartItem in json['cart_items']) {
      cartsItems.add(CartItem.fromJson(cartItem));
    }
  }
}

class CartItem {
  late int id;
  late int quantity;
  late ProductModel product;
  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }
}
