class Galleries {
  int? id;
  int? productsId;
  String? url;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Galleries(
      {this.id,
      this.productsId,
      this.url,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Galleries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productsId = json['products_id'];
    url = json['url'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['products_id'] = this.productsId;
    data['url'] = this.url;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
