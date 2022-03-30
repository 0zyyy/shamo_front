import 'package:shamo_front/models/category_model.dart';
import 'package:shamo_front/models/gallery_model.dart';

class Product {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  String? url;
  Category? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Galleries>? galleries;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.tags,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.galleries,
      this.url});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = Category.fromJson(json['category']);
    galleries = json['galleries']
        .map<Galleries>((gallery) => Galleries.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    url = json['url'];
    updatedAt = DateTime.parse(json['updated_at']);
  }

  get quantity => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'url': url,
      'category': category!.toJson(),
      'galleries': galleries!.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
