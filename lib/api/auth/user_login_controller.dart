import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:super_store/api/api.dart';
import 'package:super_store/models/user_login.dart';
import 'package:super_store/storage/prefs/user_data_preferences.dart';
import 'package:super_store/utls/helpers.dart';

class UserLoginController with Helpers {
  
  Future<bool> login({required String email, required String password, required BuildContext context}) async {
    var url = Uri.parse(API.LOGIN);
    var response = await http.post(url,body: {
      'email' : email,
      'password' : password
    });

    var jsonObject = jsonDecode(response.body);

    if(response.statusCode == 200) {
      var userLoginData = UserLogin.fromJson(jsonObject['object']);
      UserDataPreferences().savePreferences(user: userLoginData);
      showSnackBar(context: context, message: jsonObject['message'],);
      print(jsonObject['code']);
      return true;
    }
    showSnackBar(context: context, message: jsonObject['message'], error: true);
    return false;
  }
  
}