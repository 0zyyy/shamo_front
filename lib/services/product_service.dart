import 'dart:convert';
import 'package:shamo_front/models/product_model.dart';
import 'package:shamo_front/utils/app_const.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getProducts() async {
    var base = baseUrl + '/products';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(base), headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<Product> products = [];

      for (var item in data) {
        products.add(Product.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Gagal get products');
    }
  }
}
