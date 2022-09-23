// model/model_login.dart
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String id = "";
  String password = "";

  void setEmail(String id) {
    this.id = id;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}