import 'package:flutter/foundation.dart';
import 'package:shamo_front/models/user_models.dart';
import 'package:shamo_front/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  set(User user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      User user = await AuthService().register(
          name: name, email: email, password: password, username: username);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      User user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
