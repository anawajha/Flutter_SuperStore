import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:super_store/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:super_store/utls/helpers.dart';

class ResetPasswordController with Helpers{

  static final ResetPasswordController _instance = ResetPasswordController._();

  ResetPasswordController._();

  factory ResetPasswordController() => _instance;

  Future<bool> resetPassword({required String email, required String code, required String password, required BuildContext context}) async {
    var url = Uri.parse(API.RESET_PASSWORD);
    var response = await http.post(url,body: {
      'email' : email,
      'code' : code,
      'password' : password,
      'password_confirmation' : password
    });
    var jsonResponse = jsonDecode(response.body);
    if(response.statusCode == 200){
      showSnackBar(context: context, message: jsonResponse['message']);
      return true;
    }else{
      showSnackBar(context: context, message: jsonResponse['message'],error: true);
      return false;
    }
  }
}