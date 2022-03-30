import 'package:flutter/material.dart';
import 'package:shamo_front/models/cart_model.dart';
import 'package:shamo_front/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];
  List<Cart> get carts => _carts;

  set(List<Cart> carts) {
    _carts = carts;
    notifyListeners();
  }

  addToCart(Product product) {
    if (productExist(product)) {
      int index = _carts.indexWhere((element) => element.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(Cart(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  decreaseQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double totalPrice = 0.0;
    for (var item in _carts) {
      totalPrice = item.quantity * item.product!.price!;
    }
    return totalPrice;
  }

  productExist(Product product) {
    if (_carts.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    }
    return true;
  }
}
