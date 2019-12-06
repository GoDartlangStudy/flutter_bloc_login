import 'package:flutter/material.dart';

class AuthProvider {
  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    // 임시로 api 호출 된다고 가정하고 1초 딜레이
    await Future.delayed(Duration(seconds: 1));
    return 'token-info';
  }
}