import 'category_model.dart';
import 'gallery_model.dart';

class Product {
  int? id;
  String? name;
  int? price;
  String? description;
  String? tags;
  int? categoriesId;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Galleries>? galleries;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.tags,
      this.categoriesId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.galleries});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    tags = json['tags'];
    categoriesId = json['categories_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['galleries'] != null) {
      galleries = <Galleries>[];
      json['galleries'].forEach((v) {
        galleries!.add(Galleries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['categories_id'] = this.categoriesId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.galleries != null) {
      data['galleries'] = this.galleries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
