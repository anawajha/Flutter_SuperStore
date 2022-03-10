import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:super_store/api/api.dart';
import 'package:super_store/models/user.dart';

class UserApiController{

Future<List<User>> users() async {
  var url = Uri.parse(API.USERS);
  var response = await http.get(url);

if (response.statusCode == 200) {
  var jsonResponse = jsonDecode(response.body);
  List<User> users = <User>[];
   var jsonArray = jsonResponse['data'] as List;
   jsonArray.forEach((obj){
     users.add(User.fromJson(obj));
   });
   return users;
}
  return [];
}


}