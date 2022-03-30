import 'package:shamo_front/models/product_model.dart';

class Cart {
  int? id;
  Product? product;
  late int quantity;
  Cart({this.id, this.product, this.quantity = 0});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'product': product!.toJson(), 'quantity': quantity};
  }

  getTotalPrice() {
    return product!.price! * quantity;
  }
}
