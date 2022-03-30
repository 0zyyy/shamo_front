import 'package:flutter/foundation.dart';
import 'package:shamo_front/models/product_model.dart';
import 'package:shamo_front/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  set(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<Product> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
