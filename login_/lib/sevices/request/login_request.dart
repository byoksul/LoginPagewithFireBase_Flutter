import 'dart:async';

import 'package:login_/data/CtrQuery/login_ctr.dart';

import 'package:login_/models/user.dart';

class LoginRequest {
  LoginCtr con = new LoginCtr();

  Future<User> getLogin(String username, String password) {
    var result = con.getLogin(username, password);
    return result;
  }
}
