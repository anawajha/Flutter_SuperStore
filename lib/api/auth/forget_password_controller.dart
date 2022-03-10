import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:super_store/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:super_store/utls/helpers.dart';

class ForgetPasswordController with Helpers {

  static final _instance = ForgetPasswordController._();
  ForgetPasswordController._();

  factory ForgetPasswordController() => _instance;

  Future<bool> forgetPassword({required String email, required BuildContext context}) async {
    var url = Uri.parse(API.FORGET_PASSWORD);
    var response = await http.post(url,body: {
      'email' : email
    });

    var jsonResponse = jsonDecode(response.body);
    if(response.statusCode == 200){
      print(jsonResponse['code']);
        showSnackBar(context: context, message: jsonResponse['message'],);
        return true;
    }
    showSnackBar(context: context, message: jsonResponse['message'],error: true);
    return false;
  }

}