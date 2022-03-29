class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? profilePhotoUrl;
  String? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.phone,
      this.profilePhotoUrl,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['token'] = this.token;
    return data;
  }
}
