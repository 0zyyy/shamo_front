import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo_front/models/user_models.dart';
import 'package:shamo_front/utils/app_const.dart';

class AuthService {
  Future<User> register(
      {required String name,
      required String email,
      required String password,
      required String username}) async {
    var base = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });
    var response =
        await http.post(Uri.parse(base), headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal meregistrasi');
    }
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    var base = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response =
        await http.post(Uri.parse(base), headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal login');
    }
  }

  // Future<User> logout() async {
  //   var base = '$baseUrl/logout';
  //   var response = await http.post(Uri.parse(base));
  //   return response;
  // }
}
