import 'package:flutter/material.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  User _user;
  AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}