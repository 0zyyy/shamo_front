import 'package:flutter/material.dart';
import 'package:shamo_front/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;
  set wishlist(List<Product> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(Product product) {
    if (!isWishlist(product)) {
      print('added');
      _wishlist.add(product);
    } else {
      print('removed');
      _wishlist.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  isWishlist(Product product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    }
    return true;
  }
}
