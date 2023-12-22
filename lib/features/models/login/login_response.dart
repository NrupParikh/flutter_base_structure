import 'package:flutter_base_structure/features/models/login/login_data.dart';

class LoginResponseModel {
  int? result;
  int? statusCode;
  String? message;
  Data? data;

  LoginResponseModel({this.result, this.statusCode, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}