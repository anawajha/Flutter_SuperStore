
import 'package:super_store/models/user.dart';

class BaseResponse{

late bool status;
late String message;
late List<User> data;

BaseResponse.fromJson({required Map<String,dynamic> json}){
status = json['status'];
message = json['message'];

if(json['data'] != null){
  json['data'].forEach((Map<String,dynamic> obj){
    data.add(User.fromJson(obj));
  });
}

}

}